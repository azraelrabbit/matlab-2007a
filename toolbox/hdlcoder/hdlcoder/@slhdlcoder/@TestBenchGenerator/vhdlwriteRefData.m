function vhdlwriteRefData(this, hdltbcode, tbfid)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    fprintf('### Please wait ...\n');
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    for m=1.0:length(this.InportSrc)
        signame = this.InportSrc(m).loggingPortName;
        portvtype = this.InportSrc(m).PortVType;
        portsltype = this.InportSrc(m).PortSLType;
        newtype = this.InportSrc(m).HDLNewType;
        vectorSize = this.InportSrc(m).VectorPortSize;
        inlen0 = this.InportSrc(m).datalength;
        if eq(this.InportSrc(m).dataIsConstant, 1.0)
            inlen0 = 1.0;
        end % if
        % 21 23
        [iosize, iobp, iosigned] = hdlgetsizesfromtype(portsltype);
        % 23 25
        force_data = this.InportSrc(m).data;
        % 25 27
        constants = horzcat('  CONSTANT ', signame, '_force : ', newtype, ' :=\n    (\n');
        fprintf(tbfid, constants);
        % 28 30
        if gt(vectorSize, 1.0)
            for n=1.0:inlen0
                if eq(mod(n, 1000.0), 0.0)
                    fprintf('.');
                end % if
                % 34 36
                inconstvector = '      (\n';
                for m=1.0:vectorSize
                    inconst = hdlconstantvalue(force_data(n, m), iosize, iobp, iosigned, 'hex');
                    % 38 40
                    if eq(iosize, 0.0)
                        inconstants = horzcat('      ', inconst, ',\n');
                    else
                        if eq(inconst(1.0), '(')
                            inconstants = horzcat('      ', inconst, ',\n');
                        else
                            if eq(inconst(1.0), '''')
                                inconstants = horzcat('      ', inconst, ',\n');
                            else
                                if iosigned
                                    inconstants = horzcat('      ', inconst(8.0:minus(end, 1.0)), ',\n');
                                else
                                    inconstants = horzcat('      ', inconst(10.0:minus(end, 1.0)), ',\n');
                                end % if
                            end % if
                        end % if
                    end % if
                    if eq(m, vectorSize)
                        inconstants = horzcat(inconstants(1.0:minus(end, 3.0)), '),\n');
                    end % if
                    inconstvector = horzcat(inconstvector, '  ', inconstants);
                end % for
                if eq(n, inlen0)
                    inconstvector = horzcat(inconstvector(1.0:minus(end, 3.0)), ');\n\n');
                end % if
                fprintf(tbfid, inconstvector);
            end % for
        else
            for n=1.0:inlen0
                if eq(mod(n, 1000.0), 0.0)
                    fprintf('.');
                end % if
                inconst = hdlconstantvalue(force_data(n), iosize, iobp, iosigned, 'hex');
                if eq(iosize, 0.0)
                    inconstants = horzcat('      ', inconst, ',\n');
                else
                    if eq(inconst(1.0), '(')
                        inconstants = horzcat('      ', inconst, ',\n');
                    else
                        if eq(inconst(1.0), '''')
                            inconstants = horzcat('      ', inconst, ',\n');
                        else
                            if iosigned
                                inconstants = horzcat('      ', inconst(8.0:minus(end, 1.0)), ',\n');
                            else
                                inconstants = horzcat('      ', inconst(10.0:minus(end, 1.0)), ',\n');
                            end % if
                        end % if
                    end % if
                end % if
                if eq(n, inlen0)
                    inconstants = horzcat(inconstants(1.0:minus(end, 3.0)), ');\n\n');
                end % if
                fprintf(tbfid, inconstants);
            end % for
        end % if
    end % for
    for m=1.0:length(this.OutportSnk)
        signame = this.OutportSnk(m).loggingPortName;
        portvtype = this.OutportSnk(m).PortVType;
        portsltype = this.OutportSnk(m).PortSLType;
        newtype = this.OutportSnk(m).HDLNewType;
        vectorSize = this.OutportSnk(m).VectorPortSize;
        outlen0 = this.OutportSnk(m).datalength;
        if eq(this.OutportSnk(m).dataIsConstant, 1.0)
            outlen0 = 1.0;
        end % if
        [iosize, iobp, iosigned] = hdlgetsizesfromtype(portsltype);
        constants = horzcat('  CONSTANT ', signame, '_expected : ', newtype, ' :=\n    (\n');
        fprintf(tbfid, constants);
        expected_data = this.OutportSnk(m).data;
        if gt(vectorSize, 1.0)
            for n=1.0:outlen0
                if eq(mod(n, 1000.0), 0.0)
                    fprintf('.');
                end % if
                outconstvector = '      (\n';
                for m=1.0:vectorSize
                    outconst = hdlconstantvalue(expected_data(n, m), iosize, iobp, iosigned, 'hex');
                    if eq(iosize, 0.0)
                        outconstants = horzcat('      ', outconst, ',\n');
                    else
                        if eq(outconst(1.0), '(')
                            outconstants = horzcat('      ', outconst, ',\n');
                        else
                            if eq(outconst(1.0), '''')
                                outconstants = horzcat('      ', outconst, ',\n');
                            else
                                if iosigned
                                    outconstants = horzcat('      ', outconst(8.0:minus(end, 1.0)), ',\n');
                                else
                                    outconstants = horzcat('      ', outconst(10.0:minus(end, 1.0)), ',\n');
                                end % if
                            end % if
                        end % if
                    end % if
                    if eq(m, vectorSize)
                        outconstants = horzcat(outconstants(1.0:minus(end, 3.0)), '),\n');
                    end % if
                    outconstvector = horzcat(outconstvector, '  ', outconstants);
                end % for
                if eq(n, outlen0)
                    outconstvector = horzcat(outconstvector(1.0:minus(end, 3.0)), ');\n\n');
                end % if
                fprintf(tbfid, outconstvector);
            end % for
        else
            for n=1.0:outlen0
                if eq(mod(n, 1000.0), 0.0)
                    fprintf('.');
                end % if
                outconst = hdlconstantvalue(expected_data(n), iosize, iobp, iosigned, 'hex');
                if eq(iosize, 0.0)
                    outconstants = horzcat('      ', outconst, ',\n');
                else
                    if eq(outconst(1.0), '(')
                        outconstants = horzcat('      ', outconst, ',\n');
                    else
                        if eq(outconst(1.0), '''')
                            outconstants = horzcat('      ', outconst, ',\n');
                        else
                            if iosigned
                                outconstants = horzcat('      ', outconst(8.0:minus(end, 1.0)), ',\n');
                            else
                                outconstants = horzcat('      ', outconst(10.0:minus(end, 1.0)), ',\n');
                            end % if
                        end % if
                    end % if
                end % if
                if eq(n, outlen0)
                    outconstants = horzcat(outconstants(1.0:minus(end, 3.0)), ');\n\n');
                end % if
                fprintf(tbfid, outconstants);
            end % for
        end % if
    end % for
    fprintf(tbfid, hdltbcode.package_end);
    fprintf('\n');
end % function
function index = findnameindex(name_array, name)
    index = '';
    for m=1.0:length(name_array)
        if strcmpi(name_array{m}, name)
            index = m;
            break
        end % if
    end % for
end % function
