function this = Message(msgShort, msgLong)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    persistent CANONICAL_MESSAGE;
    % 13 15
    if isempty(CANONICAL_MESSAGE)
        CANONICAL_MESSAGE = feval(mfilename('class'));
    end
    % 17 19
    this = CANONICAL_MESSAGE;
    % 19 21
    if gt(nargin, 0.0)
        this.MessageShort = msgShort;
        if gt(nargin, 1.0)
            this.MessageLong = msgLong;
        end
    end
end
