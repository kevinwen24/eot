  drop procedure createEvaluation;

  create procedure createEvaluation()
  begin
  declare i int;
  set i=1;
  while i<14 do
     INSERT INTO evaluation(evaluation.evaluation_no, evaluation.item_no)
				VALUES(6, i);
      set i=i+1;
  end while;
  end;

  call createEvaluation();
