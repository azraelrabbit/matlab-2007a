function thisCopy = doCopy(this, copySiblings)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    thisCopy = copy(this);
    % 9 10
    for i=1.0:length(this.TableContent)
        thisCopiedCell = doCopy(this.TableContent(i));
        thisCopy.TableContent(i) = thisCopiedCell;
        connect(thisCopiedCell, thisCopy, 'up');
    end % for
    % 15 16
    thisCopiedCell = doCopy(this.TableTitle);
    connect(thisCopiedCell, thisCopy, 'up');
end % function
