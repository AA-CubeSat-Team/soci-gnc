function get_data_size(fswParams,soarParams)

% Count FSW Entries
nB_fsw = 0;
fswFields  = fieldnames(fswParams);
numfsw     = numel(fswFields);
for k = 1:numfsw
    field = fswParams.(fswFields{k});
    nB_fsw = get_field_size(nB_fsw,field);
end

% Count SOAR Entries
nB_soar = 0;
soarFields = fieldnames(soarParams);
numsoar    = numel(soarFields);
for k = 1:numsoar
    field = soarParams.(soarFields{k});
    nB_soar = get_field_size(nB_soar,field);
end

% Print Results
fprintf('---------------------------------------\n')
fprintf('Flight Software Parameters:  %04d Bytes\n',nB_fsw)
fprintf('SOAR Parameters:             %04d Bytes\n',nB_soar)
fprintf('---------------------------------------\n')

end

function nB = get_field_size(nB,field)
    try
        subnames = fieldnames(field);
        subnum   = numel(subnames);
        for k = 1:subnum
            subfield = getfield(field,subnames{k});
            nB = get_field_size(nB,subfield);
        end
    catch
        nB = add_var_size(nB,field);
    end
end

function nB = add_var_size(nB,var)
    switch class(var)
        case 'double'
            B_per_el = 8;
        case 'single'
            B_per_el = 4;
        case {'int8','uint8'}
            B_per_el = 1;
        case {'int16','uint16'}
            B_per_el = 2;
        case {'int32','uint32'}
            B_per_el = 4;
        case {'int64','uint64'}
            B_per_el = 8;
        case 'logical'
            B_per_el = 1;
        case 'char'
            B_per_el = 2;
        otherwise
            error('unrecognized data type')
    end
    
    nB = nB + numel(var) * B_per_el;
end

