function score = scorepredict1(m, height, weight)
%% Table -> Array
sData = TablePredict1(m, height, weight);
sData = table2array(sData)

load('TrainData.mat');

%% Predict
score = feval(model,sData(1),sData(2),sData(3),sData(4),sData(5));

end