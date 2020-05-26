function createTestTxtFiles( input_data, input_name_ascii,...
                            output_data,output_name_ascii,sys)
%createTestTxtFiles
%
% T. Reynolds | Updated: May 25, 2020

% create and/or open text files in the Test/testLogging/ folder
curdir          = cd;
repo_str_init   = strfind(curdir,'soci-gnc');
curbase         = curdir(1:repo_str_init-1);
floc            = strcat(curbase,'soci-gnc/Test/testLogging/');
Ifilename       = strcat(floc,sys,'_inputs.txt');
Ofilename       = strcat(floc,sys,'_outputs.txt');
Ifid            = fopen(Ifilename,'w+');
Ofid            = fopen(Ofilename,'w+');

%% write data to input file
[num_steps,num_val] = size(input_data);
% header
input_name = get_name_str(input_name_ascii);
write_header(Ifid,num_val,input_name,input_data(1,:));
% get data format specifier
fspec = get_fspec(num_val,input_data(1,:));
% data
for k = 1:num_steps
    fprintf(Ifid,fspec,input_data(k,:));
end

%% write data to onput file
[num_steps,num_val] = size(output_data);
% header
output_name = get_name_str(output_name_ascii);
write_header(Ofid,num_val,output_name,output_data(1,:));
% get data format specifier
fspec = get_fspec(num_val,output_data(1,:));
% data
for k = 1:num_steps
    fprintf(Ofid,fspec,output_data(k,:));
end

%% close the files
fclose(Ifid);
fclose(Ofid);

end

%% helper functions
function name = get_name_str(name_ascii)
    name_ascii = name_ascii(find(name_ascii)); %#ok
    name = char(name_ascii);
end
%
function write_header(fid,num_val,data_name,data_row)

fprintf(fid,'%d\n',1);
fprintf(fid,'%s\n',data_name);
fprintf(fid,'%d\n',num_val);
fprintf(fid,'%s\n',class(data_row(1)));
% for k = 1:num_val
%     if (k<num_val)
%         fprintf(fid,'%s,',class(data_row(k)));
%     else
%         fprintf(fid,'%s\n',class(data_row(k)));
%     end
% end
end
%
function fspec = get_fspec(num_val,data_row)

if (num_val>1)
    fspec = strcat(get_str_spec(data_row(1)),',');
    for k = 2:num_val
        if (k<num_val)
            fspec = strcat(fspec,get_str_spec(data_row(k)),',');
        else
            fspec = strcat(fspec,get_str_spec(data_row(k)),'\n');
        end
    end
else
    fspec = strcat(get_str_spec(data_row(1)),'\n');
end

    function str_spec = get_str_spec(data)
       switch class(data)
           case {'double','single','float'}
               str_spec = '%f';
           case {'int64','uint64','int32','uint32','int16','uint16',...
                 'int8','uint8','logical'}
               str_spec = '%d';
           case {'char'}
               str_spec = '%s';
           otherwise
               error('Unrecognized data type')
       end
    end
end