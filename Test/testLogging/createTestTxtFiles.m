function createTestTxtFiles(input_data,input_name,...
                            output_data,output_name,sys)
%createTestTxtFiles
%
% T. Reynolds | Updated: May 25, 2020

%% Create text files and get IO metadata

% create and/or open text files in the Test/testLogging/ folder
curdir          = cd;
repo_str_init   = strfind(curdir,'soci-gnc');
curbase         = curdir(1:repo_str_init-1);
floc            = strcat(curbase,'soci-gnc/Test/testLogging/');
Ifilename       = strcat(floc,sys,'_inputs.txt');
Ofilename       = strcat(floc,sys,'_outputs.txt');
Ifid            = fopen(Ifilename,'w+');
Ofid            = fopen(Ofilename,'w+');

% get input/output metadata
Imeta = struct;
Imeta.fid = Ifid;
Imeta.num_sig = numel(input_data);
for id = 1:Imeta.num_sig
    Imeta.num_val(id) = size(input_data{id},2);
    Imeta.type_sig{id} = class(input_data{id}(1,1));
end
% all inputs should have the same number of steps here
Imeta.num_steps = size(input_data{1},1);

Ometa = struct;
Ometa.fid = Ofid;
Ometa.num_sig = numel(output_data);
for id = 1:Ometa.num_sig
    Ometa.num_val(id) = size(output_data{id},2);
    Ometa.type_sig{id} = class(output_data{id}(1,1));
end
% all outputs should have the same number of steps here
Ometa.num_steps = size(output_data{1},1);

%% write data to input file

% create input file header
write_header(Imeta,input_name);
% get data format specifier
fspec = get_fspec(Imeta);
% data
for k = 1:Imeta.num_steps
    for id = 1:Imeta.num_sig
        fprintf(Ifid,fspec{id},input_data{id}(k,:));
    end
end

%% write data to onput file

% create output file header
write_header(Ometa,output_name);
% get data format specifier
fspec = get_fspec(Ometa);
% data
for k = 1:Ometa.num_steps
    for id = 1:Ometa.num_sig
        fprintf(Ofid,fspec{id},output_data{id}(k,:));
    end
end

%% close the files
fclose(Ifid);
fclose(Ofid);

end

%% helper functions

function write_header(meta,data_name)

    % LINE 1 : number of signals
    fprintf(meta.fid,'%d\n',meta.num_sig);
    % LINE 2 : names of signals
    for id = 1:meta.num_sig
        if (id<meta.num_sig)
            fprintf(meta.fid,'%s,',data_name{id});
        else
            fprintf(meta.fid,'%s\n',data_name{id});
        end
    end
    % LINE 3 : sizes of signals
    for id = 1:meta.num_sig
        if (id<meta.num_sig)
            fprintf(meta.fid,'%d,',meta.num_val(id));
        else
            fprintf(meta.fid,'%d\n',meta.num_val(id));
        end
    end
    % LINE 4 : types of signals
    for id = 1:meta.num_sig
        if (id<meta.num_sig)
            fprintf(meta.fid,'%s,',meta.type_sig{id});
        else
            fprintf(meta.fid,'%s\n',meta.type_sig{id});
        end
    end

end
%
function fspec = get_fspec(meta)

fspec = cell(meta.num_sig,1);

for id = 1:meta.num_sig
    % data for this signal
    num_val_id  = meta.num_val(id);
    type_id     = meta.type_sig{id};
    fspec_id    = '';
    % only break the line once we're on the last signal
    if (id == meta.num_sig)
        eol_str = '\n';
    else
        eol_str = ',';
    end
    for k = 1:num_val_id
        if (k<num_val_id)
            fspec_id = strcat(fspec_id,get_str_spec(type_id),',');
        else
            fspec_id = strcat(fspec_id,get_str_spec(type_id),eol_str);
        end
    end
    fspec{id} = fspec_id;
end

    function str_spec = get_str_spec(data_type)
       switch data_type
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