function subcomponent = getSubComponent(this, name)
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
    % 16 17
    subcomponent = [];
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    if strcmp(this.Name, name)
        % 23 24
        subcomponent = this;
        return;
        % 26 27
    end % if
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    for aComponent=this.Components
        % 35 36
        if not(isempty(aComponent))
            % 37 38
            if any(strcmp(methods(aComponent), 'getSubComponent'))
                % 39 41
                % 40 41
                subcomponent = horzcat(subcomponent, aComponent.getSubComponent(name));
            else
                % 43 46
                % 44 46
                % 45 46
                if strcmp(aComponent.Name, name)
                    % 47 48
                    subcomponent = horzcat(subcomponent, aComponent);
                    % 49 50
                end % if
                % 51 52
            end % if
            % 53 54
        end % if
        % 55 56
    end % for
end % function
