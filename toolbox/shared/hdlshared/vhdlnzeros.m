function result = vhdlnzeros(n)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if eq(n, 0.0)
        result = '';
    else
        if eq(n, 1.0)
            result = '''0''';
        else
            if hdlgetparameter('safe_zero_concat')
                result = sprintf('''%d'' & ', zeros(1.0, minus(n, 1.0)));
                result = horzcat(result, '''0''');
            else
                result = horzcat('"', sprintf('%d', zeros(1.0, n)), '"');
            end % if
        end % if
    end % if
end % function
