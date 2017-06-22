function msg = sbiodesktoperrortranslator(id)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    switch id.identifier
    case {'SimBiology:ADDSPECIES_DUPLICATENAME','SimBiology:SPECIES_DUPLICATENAME'}
        msg = 'NAME is being used by another species. Specify a different NAME.';
    case {'SimBiology:ADDPARAMETER_DUPLICATENAME','SimBiology:PARAMETER_DUPLICATENAME'}
        msg = 'NAME is being used by another parameter. Specify a different NAME.';
    case {'SimBiology:ADDMODEL_DUPLICATENAME','SimBiology:MODEL_DUPLICATENAME'}
        msg = 'NAME is being used by another model. Specify a different NAME.';
    case 'Unit:NameInvalid'
        msg = horzcat('Invalid name specified. Valid names must begin with a letter or underscore,', sprintf('\n'), 'and be followed by letters, underscores, or numbers.');
    case 'SimBiology:DELETE_SPECIES_BEING_USED'
        % 26 27
        msg = horzcat('The species was not deleted. It is being used by a reaction.', sprintf('\n'), 'Remove the species from the reaction before deleting.');
    case 'SimBiology:AKLNameInUse'
        % 29 30
        msg = horzcat('Invalid Name. The Name is already being used by a kinetic law.', sprintf('\n'), 'Specify a different Name.');
    case {'SimBiology:MissingReactionRate','SimBiology:StochCompilationNonMassActionKineticLawNoName'}
        % 32 33
        msg = horzcat('The specified solver requires each reaction''s KineticLaw to be MassAction.', sprintf('\n'), 'Select the Reaction node in the Project Explorer and verify the settings of the reactions.');
    case 'Unit:NotFound'
        % 35 36
        msg = horzcat(id.message, sprintf('\n'), 'To create a new unit go to the Desktop menu and select Unit Manager.');
    case 'SimBiology:SBIOABSTRACTKL_EXISTS_AS_USER'
        msg = 'The kinetic law already exists. Specify a different name';
    case 'SimBiology:SBIOABSTRACTKL_EXISTS_AS_BUILTIN'
        msg = 'The kinetic law already exists. Specify a different name';
    case 'SimBiology:AKLInUse'
        msg = 'The abstract kinetic law is being used by a reaction and cannot be deleted.';
    case 'SimBiology:interrupt'
        msg = {};
    otherwise
        msg = id.message;
    end % switch
end % function
