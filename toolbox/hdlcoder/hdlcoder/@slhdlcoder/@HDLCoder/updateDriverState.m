function updateDriverState(this, fullpath, nname, hdl_entity_ports, hdl_arch)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    if isempty(this.EntityNameList)
        this.EntityPathList{1.0} = fullpath;
        this.EntityNameList{1.0} = nname;
        this.EntityPortList{1.0} = hdl_entity_ports;
        this.EntityArchList{1.0} = hdl_arch;
    else
        loc = strcmpi(nname, this.EntityNameList);
        if any(loc)
            error(hdlcodererrormsgid('invalidarg'), 'Attempt to add entity %s when it is already used!', nname)
        else
            % 27 28
            this.EntityPathList{plus(end, 1.0)} = fullpath;
            this.EntityNameList{plus(end, 1.0)} = nname;
            this.EntityPortList{plus(end, 1.0)} = hdl_entity_ports;
            this.EntityArchList{plus(end, 1.0)} = hdl_arch;
        end % if
    end % if
end % function
