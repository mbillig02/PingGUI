unit PingThrd;

{ 31 March 2001 - Copyright Angus Robertson, Magenta Systems Ltd,
          angus@magsys.co.uk, http://www.magsys.co.uk/

          A threaded version of Ping to avoid applications becoming
          non-responsive while pinging.  Note the application needs to
          use a TThread OnTerminate event in which to retrieve the
          Replyxxx results of the ping.

          TPingThread needs TICMP François PIETTE internet component suite
          http://users.swing.be/francois.piette/indexuk.htm

          The outline for TPingThread was by wilfried_sonal@compuserve.com
}

interface

uses
    Windows, Messages, Classes, SysUtils, Winsock, OverbyteIcsIcmp;

type
    TPingThread = class(TThread)
    private
        FIcmp: TICMP;
    public
        PingHostName: string ;      // host name or IP address to ping
        PingLookupReply: boolean ;  // if true, ReplyAddress is reverse DNS looked-up to ReplyHostName
        PingSize: Integer ;         // bytes of data to ping
        PingTimeout: Integer ;      // milliseconds ping timeout
        PingTTL: Integer ;          // ping Time To Live, to stop ping short of host
        PingFlags: Integer ;        // ping options
        PingId: integer ;           // available in terminate event to distinguish multiple pings
        PingThreadNum: integer ;    // thread number (not ThreadId) to used in terminate event to remove thread
        DnsHostIP: String ;         // IP address looked up for PingHostName
        ReplyIPAddr: String ;       // Replying IP address (integer)
        ReplyStatus: DWORD ;        // IP status value
        ReplyRTT: DWORD ;           // Round Trip Time in milliseconds
        ReplyDataSize: Word ;       // Reply data size
        ReplyTotal: integer ;       // Number of replies to ping
        ReplyHostName: String ;     // Reply host name (if PingLookupReply=true)
        ErrCode: Integer ;          // non-zero ping or DNS error
        ErrString: String ;         // error literal if errcode non-zero

        procedure Execute; override;
    end;

var
// list of thread Ids allocated for TPingThread, so they can be stopped
    PingThreadList: array of Cardinal;

    function PingAddThread (ThreadId: Cardinal): integer ;
    procedure PingRemoveThread (ThreadNum: integer) ;
    procedure PingTerm1Thread (ThreadNum: integer) ;
    procedure PingTermAllThreads ;
    function LongAddr2Dotted (IPAddr: string): string ;

implementation

var
    num4: longword ;   // used for converting long IP address to dots
    num1: array [1..4] of byte absolute num4 ;


//------------------------------------------------------------------------------
//---- TPingThread -------------------------------------------------------------
//------------------------------------------------------------------------------

procedure TPingThread.Execute;
var
    ReplyIp: TIPAddr ;
    HostEnt: PHostEnt ;
begin
    FIcmp := TIcmp.Create ;

// see if overriding default parameters
    if PingSize <> 0 then FIcmp.Size := PingSize ;
    if PingTimeout <> 0 then FIcmp.Timeout := PingTimeout ;
    if PingTTL <> 0 then FIcmp.TTL := PingTTL ;
    FIcmp.Flags := PingFlags ;
    FIcmp.Address := trim (PingHostName) ;

// blocking ping, will also lookup IP address if required
    ReplyTotal := FIcmp.Ping ;
    DnsHostIP := FIcmp.HostIP ;
    if ReplyTotal <> 0 then
    begin
        ErrCode := 0 ;
  //    PingTTL := FIcmp.Reply.Options.TTL ;  // not sure if this gets updated
        ReplyIp := FIcmp.Reply.Address ;
        ReplyIPAddr := inet_ntoa (in_addr (ReplyIp)) ;
        ReplyHostName := ReplyIPAddr ;    // may get reversed looked up
        ReplyStatus := FIcmp.Reply.Status ;
        ReplyRTT := FIcmp.Reply.RTT ;
        ReplyDataSize := FIcmp.Reply.DataSize ;

// see if now looking up host name for reply address,
// which might not be the same address ping if TTL was less
        if PingLookupReply and (ReplyIp <> 0) then
        begin
            HostEnt := GetHostByAddr (@ReplyIp, 4, PF_INET) ;
            if HostEnt <> nil then
                     ReplyHostName := StrPas (HostEnt^.h_name) ;
        end ;
    end
    else
// ping failed
    begin
        ErrCode := FIcmp.ErrorCode ;
        ErrString := FIcmp.ErrorString ;
    end ;
    FIcmp.Destroy;
    Terminate ;
end;

//------------------------------------------------------------------------------

// keep ping ThreadId so it may be freed if it gets stuck

function PingAddThread (ThreadId: Cardinal): integer ;
begin
    SetLength (PingThreadList, Succ (Length (PingThreadList))) ;
    result := Length (PingThreadList) ;
    PingThreadList [Pred (result)] := ThreadId ;
end ;

//------------------------------------------------------------------------------

// remove ping ThreadId now it's finished

procedure PingRemoveThread (ThreadNum: integer) ;
begin
    if (ThreadNum > Length (PingThreadList)) or (ThreadNum = 0) then exit ;
    PingThreadList [Pred (ThreadNum)] := 0 ;
end ;

//------------------------------------------------------------------------------

// force ping thread to quit

procedure PingTerm1Thread (ThreadNum: integer) ;
var
    ThreadId: Cardinal ;
    I: integer ;
begin
    if (ThreadNum > Length (PingThreadList)) or (ThreadNum = 0) then exit ;
    ThreadId := PingThreadList [Pred (ThreadNum)] ;
    if ThreadId <> 0 then
      		PostThreadMessage (ThreadId, WM_QUIT, 0, 0);  // terminate thread
    PingThreadList [Pred (ThreadNum)] := 0 ;              // remove from list

// if freed all threads, free memory
    for I := 1 to Length (PingThreadList) do
    begin
        if PingThreadList [Pred (I)] <> 0 then exit ;
    end ;
    SetLength (PingThreadList, 0) ;
end ;

//------------------------------------------------------------------------------

// force all pending ping threads to quit

procedure PingTermAllThreads;
var
    I: integer;
begin
    if Length (PingThreadList) <> 0 then
    begin
   	    for I := 1 to Length (PingThreadList) do PingTerm1Thread (I) ;
	    SetLength (PingThreadList, 0) ;
    end ;
end;

//------------------------------------------------------------------------------

// convert long IP numeric address (ie 12345678) into a dotted address

function LongAddr2Dotted (IPAddr: string): string ;
var
    I: integer ;
begin
	result := trim (IPAddr) ;
	if pos ('.', IPAddr) > 0 then exit ;  // got a dotted address
    try
	    num4 := StrToInt64 (IPAddr) ;
	except ;
    	exit ;
	end ;
    if num4 = 0 then exit ;
    result := '' ;
    for I := 4 downto 1 do
    begin
    	result := result + IntToStr (num1 [I]) ;
        if I = 1 then exit ;
        result := result + '.' ;
    end ;
end ;

//------------------------------------------------------------------------------

Initialization
	SetLength (PingThreadList, 0) ;
Finalization
	PingTermAllThreads;

end.
