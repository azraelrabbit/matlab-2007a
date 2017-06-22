function [addedItem, newItemList] = appendListItem(itemList, item, searchString, delimChar, placement)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    matches = strfind(itemList, searchString);
    if isempty(matches)
        % 21 25
        % 22 25
        % 23 25
        if isempty(itemList)
            newItemList = horzcat(item, delimChar);
        else
            switch placement
            case 'end'
                if eq(itemList(length(itemList)), delimChar)
                    % 30 32
                    newItemList = horzcat(itemList, item, delimChar);
                else
                    % 33 35
                    newItemList = horzcat(itemList, delimChar, item, delimChar);
                end % if
            case 'beginning'
                if eq(itemList(1.0), delimChar)
                    % 38 41
                    % 39 41
                    newItemList = horzcat(item, itemList);
                else
                    % 42 45
                    % 43 45
                    newItemList = horzcat(item, delimChar, itemList);
                end % if
            end % switch
        end % if
        addedItem = true;
    else
        newItemList = itemList;
        addedItem = false;
    end % if
