-- Snort 3 Configuration File
--------------------------------------------------
-- Step 1: Configure network variables
--------------------------------------------------
HOME_NET = '10.0.2.15/24'
EXTERNAL_NET = 'any'

-- Port variables
HTTP_PORTS = '80,443,8080'

--------------------------------------------------
-- Step 2: Configure inspectors
--------------------------------------------------
binder = {
    -- Bind to all interfaces
    { when = { proto = 'tcp', ports = HTTP_PORTS }, 
      use = { type = 'wizard' } },
    
    { when = { proto = 'tcp' }, 
      use = { type = 'stream_tcp' } },
    
    { when = { proto = 'udp' }, 
      use = { type = 'stream_udp' } },
    
    { when = { proto = 'icmp' }, 
      use = { type = 'stream_icmp' } },
    
    { when = { service = 'http' }, 
      use = { type = 'http_inspect' } },
}

stream = { }

stream_tcp = { }

http_inspect = { }

--------------------------------------------------
-- Step 3: Configure detection
--------------------------------------------------
ips = {
    -- Enable rules
    rules = [[
        alert icmp any any -> any any ( msg:"ICMP Ping Detected"; sid:1000001; )
        alert tcp any any -> any 22 ( msg:"SSH Connection Attempt"; sid:1000002; )
        alert tcp any any -> any 80 ( msg:"HTTP GET Request"; sid:1000003; )
    ]],
    
    -- Variables for rules
    variables = default_variables
}

--------------------------------------------------
-- Step 4: Configure output
--------------------------------------------------
alert_fast = {
    file = true,
    packet = false,
    limit = 10,
}

unified2 = {
    file = true,
    limit = 128,
}

--------------------------------------------------
-- Step 5: Miscellaneous settings
--------------------------------------------------
daq = {
    module = 'afpacket',
}

profiler = { }