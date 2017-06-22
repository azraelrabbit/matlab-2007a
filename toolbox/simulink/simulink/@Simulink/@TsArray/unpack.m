function unpack(h)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    members = get(h, 'Members');
    % 6 8
    % 7 8
    for k=1.0:length(members)
        elementName = members(k).name;
        assignin('caller', elementName, get(h, elementName));
    end % for
end % function
