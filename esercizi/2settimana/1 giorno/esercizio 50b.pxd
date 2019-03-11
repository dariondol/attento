Experiment()
{
  Context()
  {
    AssignmentGroup()
    {
      ExperimentName = "Cerca la lettera 'a'";
      HideCursor = 0;
      DataFileTrialFormat = "%SubjectCode% %Target% %Trial.LetterSearch.NumberOfItems% %Trial.Feedback.Response% %Trial.LetterSearch.ResponseTime@i%";
      TrialFactor = 4;
      SubjectCode = "pxlab50b";
      StoreDataTree = 0;
      RandomizeTrials = 1;
    }
    Session()
    {
      Instruction()
      {
        Text = lang2(["Cerca la lettera 'a' in mezzo alle lettere 'e'",
		" ",
		"Premi il tasto sinistro del mouse se tra le lettere 'e' vedi la lettera 'a' e premi il tasto destro se non la vedi.",
		" ",
		"Fai la tua scelta più velocemente possibile!",
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
        Letters = "ae";
	TargetColor = lightGray();
	DistractorColor = lightGray();
        NumberOfItems = 12;
        CellSize = idiv(screenWidth(),40);
        Size = idiv(screenWidth(),40);
        Width = screenWidth();
        Height = screenHeight();
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
      FactorLevel(3);
      FactorLevel(6);
      FactorLevel(9);
      FactorLevel(12);
      FactorLevel(15); 
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
        Trial( <"positive", "negative">, <3, 6, 9, 12, 15>, ?, ?, ?);
      }
    }
  }
}
