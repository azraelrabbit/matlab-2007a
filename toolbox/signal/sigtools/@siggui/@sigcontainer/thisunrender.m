function thisunrender(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    delete(handles2vector(this));
    % 9 11
    % 10 11
    for hindx=allchild(this)
        unrender(hindx);
    end % for
    % 14 15
    delete(this.Container);
end % function
