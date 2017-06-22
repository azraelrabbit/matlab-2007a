function pSetInitData(obj, data)
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
    try
        KEY_LENGTH = 100.0;
        % 18 20
        key = data(1.0:KEY_LENGTH);
        cypherText = data(plus(KEY_LENGTH, 1.0):end);
        % 21 23
        numelPlainText = numel(cypherText);
        plainText = zeros(1.0, numelPlainText, 'uint8');
        % 24 26
        for i=1.0:KEY_LENGTH:numelPlainText
            textStart = i;
            textEnd = min(numelPlainText, minus(plus(textStart, KEY_LENGTH), 1.0));
            keyStart = 1.0;
            keyEnd = plus(minus(textEnd, textStart), 1.0);
            plainText(textStart:textEnd) = bitxor(cypherText(textStart:textEnd), key(keyStart:keyEnd));
        end % for
        % 32 35
        % 33 35
        nm = com.mathworks.toolbox.distcomp.nativedmatlab.NativeMethods;
        nm.clearFeatures;
        nm.addFeatures(distcompdeserialize(plainText));
    catch
        error('distcomp:job:LicenseError', 'Error setting license information from job.\nNested Error :\n%s', lasterr);
    end % try
