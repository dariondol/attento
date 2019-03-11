Experiment()
{
  Context()
  {
    AssignmentGroup()
    {
      ExperimentName = "Cerca la lettera 'p'";
      HideCursor = 0;
      DataFileTrialFormat = "%SubjectCode% %Target% %Trial.LetterSearch.NumberOfItems% %Trial.Feedback.Response% %Trial.LetterSearch.ResponseTime@i%";
      TrialFactor = 4;
      SubjectCode = "pxlab137b";
      StoreDataTree = 0;
      RandomizeTrials = 1;
    }
    Session()
    {
      Instruction()
      {
        Text = lang2(["Cerca la lettera 'p' in mezzo alle lettere 'b'",
		" ",
		"Premi il tasto sinistro del mouse se tra le lettere 'd' vedi la lettera 'b' e premi il tasto destro se non la vedi.",
		" ",
		"Fai la tua scelta più velocemente possibile! Prima di iniziare allarga lo schermo cliccando sul quadratino che vedi in alto a destra di questa finestra!",
		" ",
		"Prima di iniziare allarga lo schermo cliccando sul quadratino che vedi in alto a destra di questa finestra!",
		" ",
		"Premi un tasto per iniziare!"], 

		["Wie schnell finden Sie ein 'T' unter vielen 'L' ?",
                " ",
		"Drücken Sie bitte die linke Maustaste, wenn ein 'T' dabei ist und drücken Sie die rechte Maustaste, wenn kein 'T' dabei ist.",
                " ",
                "Zum Start drücken Sie bitte eine beliebige Taste."]);
      }
    }
    Trial( Target, LetterSearch.NumberOfItems, LetterSearch.ResponseCode, Feedback.Response, LetterSearch.ResponseTime)
    {
      ClearScreen:Anfang()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 2000;
      }
      FixationMark()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 400;
      }
      ClearScreen:Fix()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 400;
      }
      LetterSearch()
      {
        Letters = "pb";
	TargetColor = lightGray();
	DistractorColor = lightGray();
        NumberOfItems = 12;
        CellSize = 40;
        Size = 40;
        Width = 1500;
        Height = 600;
        ShowTarget = 1;
        Pattern = 0;
        LocalRandomization = 1;
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
        ResponseSet = [1, 3];
      }
      Feedback()
      {
        ResponseParameter = "Trial.LetterSearch.ResponseCode";
        CorrectText = lang2("Corretto!\n%Trial.LetterSearch.ResponseTime@i% ms", 
		"Richtig!\n%Trial.LetterSearch.ResponseTime@i% ms");
        FalseText = lang2("Sbagliato!\n%Trial.LetterSearch.ResponseTime@i% ms", 
		"Falsch!\n%Trial.LetterSearch.ResponseTime@i% ms");
        Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
        Visible = 1;
        Protocol = 0;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 2000;
        FontSize = 40;
      }
    }
    SessionEnd()
    {
      SessionEndMessage();
    }
  }
  Factors()
  {
    IndependentFactor( Target, Trial.LetterSearch.ShowTarget, Trial.Feedback.CorrectCode)
    {
      FactorLevel( "positive", 1, 0);
      FactorLevel( "negative", 0, 1);
    }
    IndependentFactor( Trial.LetterSearch.NumberOfItems)
    {
      FactorLevel(18); 
      FactorLevel(21); 
      FactorLevel(24);
      FactorLevel(27);
      FactorLevel(30);
    }
    DependentFactor( Trial.Feedback.Response);
    DependentFactor( Trial.LetterSearch.ResponseTime);
  }
  Procedure()
  {
    Session()
    {
      Block()
      {
        Trial( <"positive", "negative">, <18, 21, 24, 27, 30>, ?, ?, ?);
      }
    }
  }
}
