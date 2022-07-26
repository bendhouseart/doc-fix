%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create JSON using MATLAB for MEG BIDS:
% This template is for MEG data of any kind, including but not limited to task-based, resting-state, and noise
% recordings. If multiple Tasks were performed within a single Run, the task description can be set to
% "task-multitask". The _meg.json SHOULD contain details on the Tasks. Some manufacturers data storage
% conventions use folders which contain data files of various nature: for example: CTF's .ds format, or 4D/BTi.
% Please refer to Appendix VI for examples from a selection of MEG manufacturers
%
% Writing json files relies on the JSONio library
% https://github.com/gllmflndn/JSONio
% Make sure it is in the matab/octave path
%
% By @Cofficer, Created 9/03/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

root_dir = ['..' filesep '..'];
project_label = 'templates';
sub_id = '01';
ses_id = '01';
task_id = 'FullExample';
acq_id = 'CTF';
run_id = '1';

% A "proc" (processed) label has been added, especially useful for files coming from Maxfilter
% (for example: sss, tsss, trans, quat, mc, etc.)
proc_id = 'sss';

acquisition = 'meg';

meg_json_name = fullfile(root_dir, project_label, ...
                         ['sub-' sub_id], ...
                         ['ses-' ses_id], acquisition, ...
                         ['sub-' sub_id ...
                          '_task-' task_id ...
                          '_acq-' acq_id ...
                          '_run-' run_id ...
                          '_proc-' proc_id '_meg.json']);

% Assign the fields in the Matlab structure that can be saved as a json.
% The following fields must be defined:

%%

% Tasks SHOULD NOT have the same name. The Task label is derived
% from this field by removing all non alphanumeric ([a-zA-Z0-9])
% characters:
meg_json.TaskName = '';

% The name of the institution in charge of the equipment that
% produced the composite instances:
meg_json.InstitutionName = '';

% The address of the institution in charge of the equipment that
% produced the composite instances:
meg_json.InstitutionAddress = '';

% Manufacturer of the MEG system (for example: "CTF", " Elekta/Neuromag ",
% " 4D/BTi ", " KIT/Yokogawa ", " ITAB ", "KRISS", "Other"):
meg_json.Manufacturer = '';

% Manufacturer's designation of the MEG scanner model (for example:
% "CTF-275"). See Appendix VII with preferred names:
meg_json.ManufacturersModelName = '';

% Manufacturer's designation of the acquisition software.
meg_json.SoftwareVersions = '';

% Description of the task:
meg_json.TaskDescription = '';

% Text of the instructions given to participants before the scan. This is
% not only important for behavioural or cognitive tasks but also in
% resting state paradigms (for example: to distinguish between eyes open and
% eyes closed):
meg_json.Instructions = '';

% URL of the corresponding CogPO term that describes the task (for example:
% Rest "http://wiki.cogpo.org/index.php?title=Rest")
meg_json.CogPOID = '';

% The serial number of the equipment that produced the composite
% instances. A pseudonym can also be used to prevent the equipment
% from being identifiable, as long as each pseudonym is unique
% within the dataset:
meg_json.DeviceSerialNumber = '';

%%

% The following MEG specific fields must also be defined:

% Sampling frequency (in Hz) of all the data in the recording,
% regardless of their type (for example: 2400):
meg_json.SamplingFrequency = '';

% Frequency (in Hz) of the power grid at the geographical location of
% the MEG instrument (for instance: 50 or 60):
meg_json.PowerLineFrequency = '';

% Position of the dewar during the MEG scan: "upright", "supine" or
% "degrees" of angle from vertical: for example on CTF systems,
% upright=15, supine = 90:
meg_json.DewarPosition = '';

% List of temporal and/or spatial software filters applied, or ideally
% key:value pairs of pre-applied software filters and their parameter
% values: for example: {"SSS": {"frame": "head", "badlimit": 7}},
% {"SpatialCompensation": {"GradientOrder": Order of the gradient
% compensation}}. Write "n/a" if no software filters applied.
meg_json.SoftwareFilters = '';

% Boolean ("true" or "false") value indicating whether anatomical
% landmark points (for instance: fiducials) are contained within this recording.
meg_json.DigitizedLandmarks = '';

% Boolean ("true" or "false") value indicating whether head points
% outlining the scalp/face surface are contained within this recording
meg_json.DigitizedHeadPoints = '';

%%

% The following fields should be present for MEG:

% Number of MEG channels (for example: 275):
meg_json.MEGChannelCount = '';

% Number of MEG reference channels (for example: 23). For systems
% without such channels (for example: Neuromag Vectorview),
% MEGREFChannelCount =0
meg_json.MEGREFChannelCount = '';

% Number of EEG channels recorded simultaneously (for example: 21)
meg_json.EEGChannelCount = '';

% Number of ECOG channels recorded simultaneously:
meg_json.ECOGChannelCount = '';

% Number of SEEG channels recorded simultaneously:
meg_json.SEEGChannelCount = '';

% Number of EOG channels recorded simultaneously:
meg_json.EOGChannelCount = '';

% Number of ECG channels recorded simultaneously:
meg_json.ECGChannelCount = '';

% Number of EMG channels recorded simultaneously:
meg_json.EMGChannelCount = '';

% Number of miscellaneous channels recorded simultaneously:
meg_json.MiscChannelCount = '';

% Number of channels for digital (TTL bit level) triggers
meg_json.TriggerChannelCount = '';

% Length of the recording in seconds (for example: 3600)
meg_json.RecordingDuration = '';

% Defines whether the recording is "continuous" or "epoched";
% this latter limited to time windows about events of interest
% (for example: stimulus presentations, subject responses etc.)
meg_json.RecordingType = '';

% Duration of individual epochs in seconds (for example: 1) in case of
% epoched data
meg_json.EpochLength = '';

% Boolean ("true" or "false") value indicating whether continuous
% head localisation was performed.
meg_json.ContinuousHeadLocalization = '';

% List of frequencies (in Hz) used by the head localisation coils
% ('HLC' in CTF systems, 'HPI' in Elekta, 'COH' in 4D/BTi) that
% track the subject's head position in the MEG helmet (for example: [293,
% 307, 314, 321])
meg_json.HeadCoilFrequency = '';

% Maximum head movement (in mm) detected during the
% recording, as measured by the head localisation coils (for example: 4.8)
meg_json.MaxMovement = '';

% Freeform description of the observed subject artefact and its
% possible cause (for example: "Vagus Nerve Stimulator", "non-removable
% implant"). If this field is set to "n/a", it will be interpreted as
% absence of major source of artifacts except cardiac and blinks.
meg_json.SubjectArtefactDescription = '';

% Relative path in BIDS folder structure to empty-room file
% associated with the recording.
meg_json.AssociatedEmptyRoom = '';

%%

% Specific EEG fields if recorded with MEG
% SHOULD be present:

% Sampling frequency (in Hz) of the EEG recording (for example:
% 2400)
meg_json.EEGSamplingFrequency = '';

% Placement scheme of EEG electrodes. Either the name
% of a standardised placement system (for example: "10-20") or a
% list of standardised electrode names (for example: ["Cz", "Pz"] ) .
meg_json.EEGPlacementScheme = '';

% Manufacturer's designation of the EEG amplifier model
% (for example: "Biosemi-ActiveTwo").
% ManufacturersCapModelName] Manufacturer's designation of the EEG cap model (for example:
% "Biosemi-CAPML128")
meg_json.ManufacturersAmplifierModelName = '';

% Description of the type of EEG reference used (for example:
% "M1" for left mastoid, "average", or "longitudinal
% bipolar")
meg_json.EEGReference = '';

%%
% this makes the json look prettier when opened in a txt editor
json_options.indent = ' ';

jsonSaveDir = fileparts(meg_json_name);
if ~isdir(jsonSaveDir)
    fprintf('Warning: directory to save json file does not exist, create: %s \n', jsonSaveDir);
end

try
    jsonwrite(meg_json_name, meg_json, json_options);
catch
    warning('%s\n%s\n%s\n%s', ...
            'Writing the JSON file seems to have failed.', ...
            'Make sure that the following library is in the matlab/octave path:', ...
            'https://github.com/gllmflndn/JSONio');
end
