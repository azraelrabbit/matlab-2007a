function privatecheckxmlformatting(inputstring)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    if not(usejava('jvm'))
        return;
    end % if
    % 20 29
    % 21 29
    % 22 29
    import com.mathworks.xml.XMLUtils;
    import java.io.StringReader;
    import org.xml.sax.*;
    % 26 29
    % 27 29
    outputstring = '';
    if isempty(inputstring)
        return;
    end % if
    % 32 34
    sr = java.io.StringReader(inputstring);
    is = org.xml.sax.InputSource(sr);
    % 35 37
    try
        evalc('doc = XMLUtils.parse(is)');
    catch
        error('SimBiology:PRIVATECHECKXMLFORMATTING_INVALID_FORMAT', 'Invalid input string ''%s''', inputstring);
        % 40 42
    end % try
    % 42 44
    return;
