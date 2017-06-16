%% For analysis of champagne meg data
% must already have head model, ROIs and session files -  sess_speak_aligned.mat
% ZKA Dec 2015
% -------------------------------------------------------------------------
% NB if have changed the location of the MRI
% clear all
% cd /Users/zagnew/EmoVoc_meg/champagne_analysis/
%  load('/Users/zagnew/EmoVoc_meg/cham_anal/session_speakaligned.mat')
%  coreg.mripath='/Users/zagnew/EmoVoc_meg/mri/AgnewZarinah_emovoc_V2.img'
%  coreg.norm_mripath='/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.img'
%  save session_speakaligned 
clear all
folder_name = uigetdir

%folder_name = uigetdir(start_path)

cd(folder_name)
% cd /Users/zagnew/EmoVoc_meg/cham_anal/

%% 1. remake l/r session files with 8mm voxel size
% make new folder with above things in 

% load('/Users/zagnew/EmoVoc_meg/champagne_analysis/session_speakaligned_rh_voi_laugh.mat')
% coreg.mripath='/Users/zagnew/EmoVoc_meg/mri/AgnewZarinah_emovoc_V2.img'
% coreg.norm_mripath='/Users/zagnew/EmoVoc_meg/mri/wAgnewZarinah_emovoc_V2.img'
% save session_speakaligned_rh_voi_laugh.mat

sess_file.sess_file= (sprintf('%s/session_speakaligned.mat',folder_name));

% load trials file
uiopen
% load ../trials.mat

%% 2. Generate a subset of trials with each VOI according to condition

gen_trialsubset_sessionfile(sess_file.sess_file,trials.laugh(1:45), 'laugh');
gen_trialsubset_sessionfile(sess_file.sess_file, trials.disgust(1:44), 'disgust');
gen_trialsubset_sessionfile(sess_file.sess_file, trials.speech(1:43), 'speech');

%----------------------------------------------------------------------------------------

% To generate condition files for this part go and find the individual trial orders in FmtAlt/acousticdata/ -----
% load /home/zagnew/megdata/fmtAlt/acousticdata/s16/expt.mat
% expt.inds.conds
% desktop/create_conds_fmtAlt

%% champagne
% t1 = -100; 
% t2 = -5; 
% t3 = 25; 
% t4 = 250; 

t1 = -200; 
t2 = -5; 
t3 = 300; 
t4 = 1000; 
%vcs = 2  
vcs=0;
init = 1; 
ax = [0 0];
cd(folder_name)

champagne_wrapper('session_speakaligned_speech', -200, -5, 300, 1000, 2); 
champagne_wrapper('session_speakaligned_laugh', -200, -5, 300, 1000, 2); 
champagne_wrapper('session_speakaligned_disgust', -200, -5, 300, 1000, 2); 









% [sources, ialp, gamma, pow, wts] = ...
%     run_champagne('/Users/zagnew/EmoVoc_meg/champagne_analysis/cham_anal/','cham_lh_disgust',sess_file.sess_file_lh_laugh,20,t1,t2,t3,t4,init,vcs,ax)
% 
% 
% run_champagne(junk,subj,sess_name,trials,t1,t2,t3,t4,init,vcs,ax)
% 
% [sources, ialp, gamma, pow, wts] = run_champagne('/Users/zagnew/EmoVoc_meg/champagne_analysis/junk',subj,sess_name,trials,t1,t2,t3,t4,init,vcs,ax)
% 
% %will set a baseline window from -100 to -5 ms and an active window from 25 to 250 ms, and will give more freedom to fit orientation differences.


