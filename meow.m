function [ output_args ] = meow( hem, vox )

folder_name=' /Users/zagnew/EmoVoc_meg/TF_analysis'
sess_file.sess_file= (sprintf('%s/session_speakaligned.mat',folder_name));

gen_nuttf_sessionfile(sess_file.sess_file,hem,vox);

end


%addpath('/Users/zagnew/GitHub/meg_analysis_z/')