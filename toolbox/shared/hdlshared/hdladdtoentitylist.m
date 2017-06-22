function hdladdtoentitylist(fullpath, nname, hdl_entity_ports, hdl_arch)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisfiltercoder
        % 8 9
        hdl_parameters = PersistentHDLPropSet;
        hINI = hdl_parameters.INI;
        hFC = hINI.getPropSet('Filter').getPropSet('Common');
        % 12 13
        if isempty(hFC.entitynamelist)
            hFC.entitypathlist{1.0} = fullpath;
            hFC.entitynamelist{1.0} = nname;
            hFC.entityportlist{1.0} = hdl_entity_ports;
            hFC.entityarchlist{1.0} = hdl_arch;
        else
            loc = strcmpi(nname, hFC.entitynamelist);
            if any(loc)
                error('Attempt to add entity %s when it is already used!', nname)
            else
                hFC.entitypathlist{plus(end, 1.0)} = fullpath;
                hFC.entitynamelist{plus(end, 1.0)} = nname;
                hFC.entityportlist{plus(end, 1.0)} = hdl_entity_ports;
                hFC.entityarchlist{plus(end, 1.0)} = hdl_arch;
            end % if
        end % if
    else
        % 30 32
        % 31 32
        hCurrentDriver = hdlcurrentdriver;
        updateDriverState(hCurrentDriver, fullpath, nname, hdl_entity_ports, hdl_arch);
        % 34 35
    end % if
end % function
