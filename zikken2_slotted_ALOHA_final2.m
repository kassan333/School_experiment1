%%Slotted ALOHA�V�~�����[�V�����v���O����%%
S_S = zeros(1,28);
S_R_1 = zeros(1,28);
for k = 1: 28
 %%�ɂ𐶐����镪��%%
 if(k <= 10)
  l = k/100;
 elseif(k > 10 && k < 20)
  l = (k-9)/10;
 elseif(k >= 20 && k <= 28)
  l = (k-18);
 endif
  i = 0;
  count = 0;
  trials = 100;
  len = 1000;
  S_R = zeros(1,trials);
  %%y = poissrnd(l,1,len);%%�|�A�\�����z�ɏ]���z��𐶐�%%
  %%10000�񎎍s�����̕��ς��Ƃ萔�l���v�Z����%%
  for j = 1: trials
    y = poissrnd(l,1,len);%%�|�A�\�����z�ɏ]���z��𐶐�%%
    while(i < len)
      i = i+1;
      if(y(i) == 1)%%T�ԂɃp�P�b�g��1��ċN������%%
        count = count + 1; 
      endif       
    endwhile
    
    if(sum(y) == 0)
      S = 0;
      S_r(j) = S;
    else
      S = l*(count/(sum(y)));
      S_R(j) = S;
    endif

  endfor
  S_S(k) = sum(S_R)/trials;
  S_R_1(k) = l*e^(-l);
 endfor

%csvwrite('Slotted_ALOHA_real_final2.csv',S_S);
csvwrite('Slotted_ALOHA_logic_final.csv',S_R_1);