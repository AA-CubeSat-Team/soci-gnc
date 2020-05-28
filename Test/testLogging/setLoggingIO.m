function [input_data,input_name,output_data,output_name] = ...
         setLoggingIO(input_data1,input_data2,input_data3,input_data4,...
                      input_data5,input_data6,input_data7,input_data8,...
                      input_data9,input_data10,...
                      input_name1,input_name2,input_name3,input_name4,...
                      input_name5,input_name6,input_name7,input_name8,...
                      input_name9,input_name10,...
                      output_data1,output_data2,output_data3,output_data4,...
                      output_data5,output_data6,output_data7,output_data8,...
                      output_data9,output_data10,...
                      output_name1,output_name2,output_name3,output_name4,...
                      output_name5,output_name6,output_name7,output_name8,...
                      output_name9,output_name10) 
%setLOGGING
%
% This function is used as a callback for the test_IO_log_lib library to be
% executed once a unit test has completed. The syntax is:
%
%   setLogging(input_data1,...,input_dataN,input_name1,...,input_nameN,
%          output_data1,...,output_dataN,output_name1,...,output_nameN)
%
% where N is a fixed number. This function will look through the signals
% and store the wanted ones (those not named "ignore") in cells called
%               <input/output>_data  and <input/output>_name
% and then clear the individual signals to avoid cluttering the workspace.
%
% This function must be called before createTestTxtFiles is called.
%
% T. Reynolds | Updated: May 28, 2020

%#ok<*INUSL>
%% Pre-parsing
% number of supported inputs/outputs
N = 10;
% find the number of inputs/outputs
sig_in = true(N,1);
for id = 1:N
    chk_sig(id,'in');
end
num_in = sum(sig_in);

sig_out = true(N,1);
for id = 1:N
    chk_sig(id,'out');
end
num_out = sum(sig_out);

%% create cells of input data & names
input_data  = cell(num_in,1);
input_name  = cell(num_in,1);
msg_data_in = 'input_data{%d} = input_data%d;';
msg_name_in = 'input_name{%d} = input_name%d;';
id = 1;
for sig = 1:N
    if (sig_in(sig))
        id = add_sig_data(msg_data_in,msg_name_in,id);
    end
end

%% create cells of output data & names
output_data  = cell(num_out,1);
output_name  = cell(num_out,1);
msg_data_out = 'output_data{%d} = output_data%d;';
msg_name_out = 'output_name{%d} = output_name%d;';
id = 1;
for sig = 1:N
    if (sig_out(sig))
        id = add_sig_data(msg_data_out,msg_name_out,id);
    end
end

%% Post-parsing

% clear variables from workspace to avoid clutter
evalin( 'base', 'clear input_data1 input_name1' )
evalin( 'base', 'clear input_data2 input_name2' )
evalin( 'base', 'clear input_data3 input_name3' )
evalin( 'base', 'clear input_data4 input_name4' )
evalin( 'base', 'clear input_data5 input_name5' )
evalin( 'base', 'clear input_data6 input_name6' )
evalin( 'base', 'clear input_data7 input_name7' )
evalin( 'base', 'clear input_data8 input_name8' )
evalin( 'base', 'clear input_data9 input_name9' )
evalin( 'base', 'clear input_data10 input_name10' )
evalin( 'base', 'clear output_data1 output_name1' )
evalin( 'base', 'clear output_data2 output_name2' )
evalin( 'base', 'clear output_data3 output_name3' )
evalin( 'base', 'clear output_data4 output_name4' )
evalin( 'base', 'clear output_data5 output_name5' )
evalin( 'base', 'clear output_data6 output_name6' )
evalin( 'base', 'clear output_data7 output_name7' )
evalin( 'base', 'clear output_data8 output_name8' )
evalin( 'base', 'clear output_data9 output_name9' )
evalin( 'base', 'clear output_data10 output_name10' )

end

function name = get_name_str(name_ascii)
    name_ascii = name_ascii(find(name_ascii)); %#ok
    name = char(name_ascii);
end

function there = sig_there(name) %#ok
    if (strcmp(get_name_str(name),'ignore'))
        there = false;
    else
        there = true;
    end
end

function id = add_sig_data(msg_data_in,msg_name_in,id)
    evalin( 'caller', sprintf(msg_data_in,id,id) )
    evalin( 'caller', sprintf(msg_name_in,id,id) )
    id = id + 1;
end

function chk_sig(id,io)
    msg = sprintf('sig_%s(%d) = sig_there(%sput_name%d);',io,id,io,id);
    evalin( 'caller', msg );
end