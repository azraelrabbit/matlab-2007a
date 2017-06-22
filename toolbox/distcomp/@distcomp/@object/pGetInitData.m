function data = pGetInitData(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent plainText;
    % 9 11
    if isempty(plainText)
        % 11 13
        clientProducts = system_dependent('lmfeaturelist');
        % 13 16
        % 14 16
        disabledProducts = {'Excel_Link';'Filter_Design_HDL_Coder';'Link_for_ModelSim';'MATLAB_Link_for_CCS';'Compiler';'MATLAB_Web_Server';'Real-Time_Workshop';'Stateflow_Coder';'Simulink_HDL_Coder'};
        % 16 27
        % 17 27
        % 18 27
        % 19 27
        % 20 27
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        found = ismember(clientProducts, disabledProducts);
        % 27 30
        % 28 30
        clientProducts(found) = [];
        % 30 34
        % 31 34
        % 32 34
        for i=numel(clientProducts):-1.0:1.0
            javaClientProducts(i) = java.lang.String(clientProducts{i});
        end % for
        % 36 39
        % 37 39
        plainText = distcompserialize(javaClientProducts);
    end
    % 40 50
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    state = rand('state');
    % 50 52
    rand('state', sum(mtimes(100.0, clock)));
    % 52 54
    KEY_LENGTH = 100.0;
    % 54 56
    key = uint8(floor(mtimes(rand(1.0, KEY_LENGTH), 256.0)));
    numelPlainText = numel(plainText);
    cypherText = zeros(1.0, numelPlainText, 'uint8');
    % 58 60
    for i=1.0:KEY_LENGTH:numelPlainText
        textStart = i;
        textEnd = min(numelPlainText, minus(plus(textStart, KEY_LENGTH), 1.0));
        keyStart = 1.0;
        keyEnd = plus(minus(textEnd, textStart), 1.0);
        cypherText(textStart:textEnd) = bitxor(plainText(textStart:textEnd), key(keyStart:keyEnd));
    end % for
    data = horzcat(key, cypherText);
    rand('state', state);
end
