function info = datainfo(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    info = '';
    % 8 11
    % 9 11
    if not(isempty(get(h, 'S_Parameters'))) && hasnoisereference(h) && haspowerreference(h)
        % 11 13
        info = 'All Data';
    else
        if not(isempty(get(h, 'S_Parameters'))) && haspowerreference(h)
            info = 'Power Data with Network Parameters';
        else
            if haspowerreference(h) && hasnoisereference(h)
                info = 'Power Data with Noise Data';
            else
                if not(isempty(get(h, 'S_Parameters'))) && hasnoisereference(h)
                    info = 'Network Parameters With Noise Data';
                else
                    if haspowerreference(h)
                        info = 'Power Data Only';
                    else
                        if not(isempty(get(h, 'S_Parameters')))
                            info = 'Network Parameters Only';
                        else
                            if hasnoisereference(h)
                                info = 'Noise Data Only';
                            end
                        end
                    end
                end
            end
        end
    end
end
