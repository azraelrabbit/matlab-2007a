function privgeneratetb(filterobj, tbtype, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(builtin('license', 'checkout', 'Filter_Design_HDL_Coder'))
        error(generatemsgid('nolicenseavailable'), 'Unable to check out a license for the Filter Design HDL Coder.');
        % 10 11
    end % if
    % 12 14
    % 13 14
    position = strmatch('targetlang', varargin(1.0:2.0:end));
    if not(isempty(position))
        tbtype = varargin{mtimes(2.0, position)};
        varargin(mtimes(2.0, position)) = [];
        varargin(minus(mtimes(2.0, position), 1.0)) = [];
    end % if
    % 20 21
    supported_tbtypes = {'ModelSim','VHDL','Verilog'};
    expected_one_of = 'Illegal value ''%s'' for %s, expected one of %s.';
    errstr = '';
    for n=1.0:minus(length(supported_tbtypes), 1.0)
        errstr = horzcat(errstr, '''', supported_tbtypes{n}, ''', ');
    end % for
    errstr = horzcat(errstr, 'or ''', supported_tbtypes{end}, '''');
    % 28 29
    if not(iscell(tbtype))
        tbtype = cellhorzcat(tbtype);
    end % if
    % 32 33
    tbtype = reshape(tbtype, 1.0, length(tbtype));
    % 34 35
    temp_tbtype = {};
    count = 1.0;
    for v=tbtype
        position = strmatch(lower(v), lower(supported_tbtypes));
        if isempty(position) || gt(length(position), 1.0)
            error(generatemsgid('illegalparametervalue'), expected_one_of, v{1.0}, 'Test Bench Type', errstr);
        else
            % 42 43
            temp_tbtype{count} = supported_tbtypes{position};
            count = plus(count, 1.0);
        end % if
    end % for
    % 47 49
    % 48 49
    if any(strcmpi(supported_tbtypes{1.0}, temp_tbtype))
        generatemodelsimtb(filterobj, varargin{:});
    end % if
    % 52 54
    % 53 54
    hdlsetparameter('hdlcompilescript', true);
    hdlsetparameter('hdlcompiletb', true);
    hdlsetparameter('hdlsimscript', true);
    hdlsetparameter('hdlsimprojectscript', false);
    hdlsetparameter('hdlsynthscript', false);
    hdlsetparameter('hdlmapfile', false);
    % 60 61
    if any(strcmpi(supported_tbtypes{2.0}, temp_tbtype))
        generatevhdltb(filterobj, varargin{:});
        hdlwritescripts;
    end % if
    % 65 66
    if any(strcmpi(supported_tbtypes{3.0}, temp_tbtype))
        generateverilogtb(filterobj, varargin{:});
        hdlwritescripts;
    end % if
end % function
