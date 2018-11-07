path = "/var/phd/deeplearning/clgen/slx";
dinfo = dir(path+"*.slx");
cd(path);
for K = 1 : length(dinfo)
  [p,name,ext] = fileparts(dinfo(K).name);
  disp("Preprocing "+name);
  if exist(name+".mdl", 'file') == 2
      continue
  end
  load_system(name+".slx")
  save_system(name,name+".mdl")
  close_system(name,0)
end
disp("Converting Finished!");