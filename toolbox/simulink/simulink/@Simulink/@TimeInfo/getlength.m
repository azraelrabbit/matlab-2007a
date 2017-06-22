function outLength = getlength(this, eventData)
    % 1 3
    % 2 3
    if not(isempty(this.Increment)) && not(isnan(this.Increment)) && gt(this.Increment, 0.0)
        % 4 5
        numIntervals = min(length(this.Start), length(this.End));
        outLength = 0.0;
        for k=1.0:numIntervals
            if ge(minus(this.End(k), this.Start(k)), 0.0)
                outLength = plus(plus(outLength, round(mrdivide(minus(this.End(k), this.Start(k)), this.Increment))), 1.0);
                % 10 11
            end % if
        end % for
    else
        outLength = this.Length_;
    end % if
end % function
