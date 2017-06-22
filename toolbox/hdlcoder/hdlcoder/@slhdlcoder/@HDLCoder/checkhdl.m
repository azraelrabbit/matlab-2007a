function varargout = checkhdl(this, slConnection, pirFrontEnd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(builtin('license', 'checkout', 'Simulink_HDL_Coder')) || not(hdlcoderui.isslhdlcinstalled)
        % 8 11
        % 9 11
        error(hdlcodererrormsgid('nolicenseavailable'), 'Unable to check out a license for the Simulink HDL Coder.');
        % 11 13
    end % if
    % 13 17
    % 14 17
    % 15 17
    cur_lasterror = lasterror;
    % 17 20
    % 18 20
    oldDriver = hdlcurrentdriver;
    hdlcurrentdriver(this);
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    if lt(nargin, 2.0)
        this.commitParams;
    end % if
    % 29 32
    % 30 32
    oldMode = hdlcodegenmode;
    hdlcodegenmode('slcoder');
    % 33 35
    try
        % 35 37
        hdldisp('Starting HDL Check.', 1.0);
        % 37 39
        refreshPVPairCache(this);
        % 39 41
        if lt(nargin, 2.0)
            % 41 43
            this.connectToModel;
            slConnection = this.ModelConnection;
            % 44 46
            [p, pirFrontEnd] = runPirFrontEnd(this, slConnection, 1.0);
        end % if
        % 47 50
        % 48 50
        pirFEChecks = pirFrontEnd.getChecks;
        % 50 53
        % 51 53
        blockChecks = pirFrontEnd.validatePIR(this.PirInstance);
        % 53 56
        % 54 56
        beta1checks = hdltrav(this.StartNodeName, @checkhdlentity, slConnection.StartNode);
        % 56 59
        % 57 59
        globalChecks = performGlobalChecks(this);
        % 59 61
        checks = [];
        checks = cat(2.0, checks, pirFEChecks);
        checks = cat(2.0, checks, blockChecks);
        checks = cat(2.0, checks, beta1checks);
        checks = cat(2.0, checks, globalChecks);
        % 65 67
        if eq(nargout, 0.0)
            this.makehdlcheckreport(checks);
        else
            varargout{1.0} = checks;
        end % if
        % 71 73
        if eq(length(checks), 1.0)
            hdldisp(sprintf('HDL Check Complete with 1 error, warning or message.\n'), 1.0);
        else
            hdldisp(sprintf('HDL Check Complete with %d errors, warnings and messages.\n', length(checks)), 1.0);
            % 76 78
        end % if
    catch
        % 79 82
        % 80 82
        savederr = lasterror;
        fclose('all');
        this.cleanup(oldDriver, oldMode, false);
        rethrow(savederr);
        % 85 87
    end % try
    % 87 89
    closeconnection = lt(nargin, 2.0);
    this.cleanup(oldDriver, oldMode, false, closeconnection);
    % 90 93
    % 91 93
    hdlcurrentdriver(oldDriver);
    hdlcodegenmode(oldMode);
    % 94 96
    if lt(nargin, 2.0)
        % 96 98
        this.closeConnection;
    end % if
    % 99 103
    % 100 103
    % 101 103
    lasterror(cur_lasterror);
end % function
function checks = performGlobalChecks(this)
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    checks = [];
    % 111 114
    % 112 114
    rates = this.ModelConnection.ModelRates;
    % 114 116
    if any(eq(rates, -2.0))
        checks.path = this.StartNodeName;
        checks.type = 'model';
        checks.message = 'Triggered sample times are not supported for HDL code generation.';
        checks.level = 'Error';
    else
        if all(eq(rates, -1.0))
            checks.path = this.StartNodeName;
            checks.type = 'model';
            checks.message = 'Triggered and asynchronous sample times are not supported for HDL code generation.';
            checks.level = 'Error';
        else
            if all(lt(rates, 0.0))
                checks.path = this.StartNodeName;
                checks.type = 'model';
                checks.message = 'Negative sample times are not supported for HDL code generation.';
                checks.level = 'Error';
            else
                if all(eq(rates, 0.0))
                    checks.path = this.StartNodeName;
                    checks.type = 'model';
                    checks.message = 'All sample times are default (0) in this model.';
                    checks.level = 'Message';
                else
                    rates(eq(rates, 0.0)) = min(rates(gt(rates, 0.0)));
                    if not(all(eq(rates(1.0), rates)))
                        checks.path = this.StartNodeName;
                        checks.type = 'model';
                        if hdlgetparameter('MultiRateBetaFeature')
                            checks.message = 'Multirate is a beta feature: Please check the results carefully!';
                            checks.level = 'Warning';
                        else
                            checks.message = 'Multiple sample times detected in the model: multiple sample times in the HDL portion of your model are not supported in this release.';
                            checks.level = 'Warning';
                        end % if
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
