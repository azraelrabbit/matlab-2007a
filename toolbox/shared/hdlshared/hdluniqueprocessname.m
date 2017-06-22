function uniquename = hdluniqueprocessname(seed)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent incrementvalue;
    % 8 10
    if isempty(incrementvalue)
        incrementvalue = 0.0;
    end
    % 12 14
    if eq(nargin, 1.0)
        incrementvalue = seed;
    end
    % 16 18
    uniquename = horzcat('temp', hdlgetparameter('clock_process_label'), num2str(incrementvalue));
    % 18 20
    incrementvalue = plus(incrementvalue, 1.0);
end
