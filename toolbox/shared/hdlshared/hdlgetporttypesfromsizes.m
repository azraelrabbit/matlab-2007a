function [vtype, sltype] = hdlgetporttypesfromsizes(insize, inbp, insigned)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if eq(insize, 0.0)
        if hdlgetparameter('isvhdl')
            vtype = 'real';
        else
            vtype = 'wire [63:0]';
        end % if
    else
        if eq(insize, 1.0)
            vtype = hdlgetparameter('base_data_type');
        else
            if hdlgetparameter('isvhdl')
                vtype = horzcat('std_logic_vector(', num2str(minus(insize, 1.0)), ' DOWNTO 0)');
            else
                if hdlgetparameter('isverilog')
                    if eq(insigned, 1.0)
                        vtype = horzcat('wire signed [', num2str(minus(insize, 1.0)), ':0]');
                    else
                        vtype = horzcat('wire [', num2str(minus(insize, 1.0)), ':0]');
                    end % if
                else
                    error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
                end % if
            end % if
        end % if
    end % if
    if eq(insize, 0.0)
        sltype = 'double';
    else
        if eq(insize, 1.0)
            sltype = 'boolean';
        else
            if eq(inbp, 0.0)
                sltype = horzcat('fix', num2str(insize));
            else
                if lt(inbp, 0.0)
                    sltype = horzcat('fix', num2str(insize), '_E', num2str(uminus(inbp)));
                else
                    sltype = horzcat('fix', num2str(insize), '_En', num2str(inbp));
                end % if
            end % if
        end % if
    end % if
    if ne(insize, 0.0) && ne(insize, 1.0)
        if eq(insigned, 1.0)
            sltype = horzcat('s', sltype);
        else
            sltype = horzcat('u', sltype);
        end % if
    end % if
end % function
