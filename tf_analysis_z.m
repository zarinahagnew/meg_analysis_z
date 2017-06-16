%% For analysis of tf meg data
% must already have head model, ROIs and session files -  sess_speak_aligned.mat
% ZKA Dec 2015
% NB if have changed the location of the MRI
% clear all
% cd /Users/zagnew/EmoVoc_meg/champagne_analysis/
% load('/Users/zagnew/EmoVoc_meg/tf_analysis/session_speakaligned.mat')
% coreg.mripath='/Users/zagnew/EmoVoc_meg/mri/AgnewZarinah_emovoc_V2.img'
% coreg.norm_mripath='/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.img'
% save session_speakaligned 

% use 5mm voxels

% go to data: -------------------------------------------------------------
%folder_name = uigetdir
folder_name='/Users/zagnew/EmoVoc_meg/TF_analysis'
cd(folder_name)
cd /Users/zagnew/EmoVoc_meg/TF_analysis

condition='speech';

sess_file.sess_file= (sprintf('%s/session_speakaligned.mat',folder_name));
sess_file.sess_file_rh=(sprintf('%s/session_speakaligned_rh_voi.mat',folder_name));
sess_file.sess_file_rh_speech=(sprintf('%s/session_speakaligned_rh_voi_speech.mat',folder_name));
sess_file.sess_file_rh_speech_tfbf= (sprintf('%ssession_speakaligned_rh_voi_speechfirls200_SAMcn.mat',folder_name));
sess_file.sess_file_lh=(sprintf('%s/session_speakaligned_lh_voi.mat',folder_name));
sess_file.sess_file_lh_speech=(sprintf('%s/session_speakaligned_lh_voi_speech.mat',folder_name));
sess_file.sess_file_lh_speech_tfbf= (sprintf('%ssession_speakaligned_lh_voi_speechfirls200_SAMcn.mat',folder_name));

load ../trials.mat

% create hemisphere specific session files --------------------------------
gen_nuttf_sessionfile(sess_file.sess_file,'lh',5);
gen_nuttf_sessionfile(sess_file.sess_file,'rh',5);


% create condition specific session file ----------------------------------

gen_trialsubset_sessionfile(sess_file.sess_file_rh, trials.laugh(1:45), 'laugh');
gen_trialsubset_sessionfile(sess_file.sess_file_lh, trials.laugh(1:45), 'laugh');
gen_trialsubset_sessionfile(sess_file.sess_file_rh, trials.disgust(1:44), 'disgust');
gen_trialsubset_sessionfile(sess_file.sess_file_lh, trials.disgust(1:44), 'disgust');
gen_trialsubset_sessionfile(sess_file.sess_file_rh, trials.speech(1:43), 'speech');
gen_trialsubset_sessionfile(sess_file.sess_file_lh, trials.speech(1:43), 'speech');

% tfbf --------------------------------------------------------------------
%tfbf(sess_file.sess_file_lh_speech,'/Users/zagnew/EmoVoc_meg/TF_analysis/timewindows/100ms.mat',100,200,'firls200','SAMcn')s
%nut_tfbf2timef session_speakaligned_lh_voi_speech_firls200_SAMcn SAM 

run_nuttfbf_all('/Users/zagnew/EmoVoc_meg/TF_analysis/session_speakaligned_lh_voi_speech',[100 200],[65 13],[90 30])
run_nuttfbf_all('/Users/zagnew/EmoVoc_meg/TF_analysis/session_speakaligned_lh_voi_speak',[100 200],[65 13],[90 30])
run_nuttfbf_all('/Users/zagnew/EmoVoc_meg/TF_analysis/session_speakaligned_lh_voi_disgust',[100 200],[65 13],[90 30])
run_nuttfbf_all('/Users/zagnew/EmoVoc_meg/TF_analysis/session_speakaligned_rh_voi_speech',[100 200],[65 13],[90 30])
run_nuttfbf_all('/Users/zagnew/EmoVoc_meg/TF_analysis/session_speakaligned_rh_voi_speak',[100 200],[65 13],[90 30])
run_nuttfbf_all('/Users/zagnew/EmoVoc_meg/TF_analysis/session_speakaligned_rh_voi_disgust',[100 200],[65 13],[90 30])

nut_normalize_beam('s_beamtf_session_speakaligned_lh_voi_speech_firls200_SAMcn_SAM_all.mat','/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.hdr')
nut_normalize_beam('s_beamtf_session_speakaligned_lh_voi_laugh_firls200_SAMcn_SAM_all.mat','/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.hdr')
nut_normalize_beam('s_beamtf_session_speakaligned_lh_voi_disgust_firls200_SAMcn_SAM_all.mat','/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.hdr')
nut_normalize_beam('s_beamtf_session_speakaligned_rh_voi_speech_firls200_SAMcn_SAM_all.mat','/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.hdr')
nut_normalize_beam('s_beamtf_session_speakaligned_lh_voi_laugh_firls200_SAMcn_SAM_all.mat','/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.hdr')
nut_normalize_beam('s_beamtf_session_speakaligned_lh_voi_disgust_firls200_SAMcn_SAM_all.mat','/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.hdr')

% statistics --------------------------------------------------------------
nut_timef_stats
nut_timef_stats('s_beamtf_session_speakaligned_lh_voi_speech_firls200_SAMcn_SAM_all.mat')



% remove all others
delete('s_beamtf*SAM.mat')

% viewing 

select

lected Voxel" to bring you to the max time point at that voxel. 
Alternatively, you may select a different time peak (or time window) and then the spatial activations at that new time will be updated in the right-hand window (click on "Selected Time Points(s)" to bring you to the max voxel for that time of interest).

By changing the ?Threshold +/-? values, you can limit the display of power changes to values above and below a certain power change cutoff.

% or
% run_nuttfbf_all(sess_file.sess_file_lh_speech,[100 200], [65 13], [90 30]);
% - doesnt work

% Assembling all sbeam files into one s_beamtf composite
% eg nut_tfbf2timef sessionname_firls200_SAMcn SAM

% remove all others
delete('s_beamtf*SAM.mat')

% filename='s_beamtf_session_speakaligned_lh_voi_speech_firls200_SAMcn_SAM_all'
% 
% nut_normalize_beam(beamname,normedMRI,newvoxsize) 
nut_normalize_beam('s_beamtf_session_speakaligned_lh_voi_speech_firls200_SAMcn_SAM_all.mat','/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.hdr', 8)

%creates s_beamtf_session_speakaligned_lh_voi_speech_firls200_SAMcn_SAM_all_spatnorm



