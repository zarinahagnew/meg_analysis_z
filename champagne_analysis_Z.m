%% for analysis of champagne meg data
% must already have head model, ROIs and session files -  sess_speak_aligned.mat

folder_name = uigetdir

%folder_name = uigetdir(start_path)

cd(folder_name)
% cd /Users/zagnew/EmoVoc_meg/champagne_analysis/

%% 1. remake l/r session files with 8mm voxel size
% make new folder with above things in 

sess_file.sess_file= (sprintf('%s/session_speakaligned.mat',folder_name));

gen_nuttf_sessionfile(sess_file.sess_file,'rh',8);
gen_nuttf_sessionfile(sess_file.sess_file,'lh',8);

% load trials file
uiopen

% or 
% load ../trials.mat

sess_file.sess_file_rh=(sprintf('%s/session_speakaligned_rh_voi.mat',folder_name));
sess_file.sess_file_lh=(sprintf('%s/session_speakaligned_lh_voi.mat',folder_name));

%% 2. Generate a subset of trials with each VOI according to condition

gen_trialsubset_sessionfile(sess_file.sess_file_rh,trials.laugh(1:45), 'laugh');
gen_trialsubset_sessionfile(sess_file.sess_file_lh,trials.laugh(1:45), 'laugh');
gen_trialsubset_sessionfile(sess_file.sess_file_rh, trials.disgust(1:44), 'disgust');
gen_trialsubset_sessionfile(sess_file.sess_file_lh, trials.disgust(1:44), 'disgust');
gen_trialsubset_sessionfile(sess_file.sess_file_rh, trials.speech(1:43), 'speech');
gen_trialsubset_sessionfile(sess_file.sess_file_lh, trials.speech(1:43), 'speech');

----------------------------------------------------------------------------------------

% To generate condition files for this part go and find the individual trial orders in FmtAlt/acousticdata/ -----
% load /home/zagnew/megdata/fmtAlt/acousticdata/s16/expt.mat
% expt.inds.conds

% desktop/create_conds_fmtAlt

%% champagne
sess_file.sess_file_rh_laugh=(sprintf('%s/session_speakaligned_rh_voi_laugh.mat',folder_name));
sess_file.sess_file_lh_laugh=(sprintf('%s/session_speakaligned_lh_voi_laugh.mat',folder_name));

t1 = -100; 
t2 = -5; 
t3 = 25; 
t4 = 250; 
vcs = 2  
init = 1; 
ax = [0 0];

[sources, ialp, gamma, pow, wts] = ...
    run_champagne('/Users/zagnew/EmoVoc_meg/champagne_analysis/cham_anal',...
    'cham_lh_disgust',sess_file.sess_file_lh_laugh,20,t1,t2,t3,t4,init,vcs,ax)




[sources, ialp, gamma, pow, wts] = run_champagne('/Users/zagnew/EmoVoc_meg/champagne_analysis/junk',subj,sess_name,trials,t1,t2,t3,t4,init,vcs,ax)

%will set a baseline window from -100 to -5 ms and an active window from 25 to 250 ms, and will give more freedom to fit orientation differences.

