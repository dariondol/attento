Experiment()
{
  Context()
  {
    AssignmentGroup()
    {
      new LetterCombination = 1;
      new Repetition = 1;
      new Art = 1;
      SubjectCode = "pxlab101";
      DataFileTrialFormat = "%SubjectCode% %TrialCounter% %Art% %Trial.TextParagraph.ResponseTime% %Trial.Feedback.Response%";
      ExperimentName = lang2("Same/Different Tasks (Posner & Mitchell, 1967)", "Gleich/verschieden-Aufgaben (Posner & Mitchell, 1967)");
    }
    Session()
    {
      Instruction()
      {
        Text = lang2(["UGUALE O DIVERSA.\n \nVEDRAI DUE LETTERE.\n \nIL TUO COMPITO E' DECIDERE SE SONO DELLO STESSO TIPO (VOCALI, CONSONANTI)\n \nUSA IL TASTO FRECCIA DI SINISTRA, SE SONO ENTRAMBE O VOCALI O CONSONANTI.\n \nUSA IL TASTO FRECCIA DI DESTRA SE SONO UNA VOCALE E UNA CONSONANTE.\n \nPREMI UN TASTO PER CONTINUARE."],
	["Klassifikation von Buchstaben",
		" ",
		"In jedem Durchgang werden Ihnen zwei Buchstaben dargeboten.",
		"Ihre Aufgabe ist, zu entscheiden, ob die beiden Buchstaben vom gleichen Typ (Vokal, Konsonant) sind.",
		"Drücken Sie bitte die Pfeiltaste nach links, falls beide Buchstaben Vokale oder beide Buchstaben Konsonanten sind und drücken Sie bitte die Pfeiltaste nach rechts, falls die beiden Buchstaben verschiedenen Typs sind.",
		" ",
		"Zum Starten drücken Sie bitte eine beliebige Taste!"]);
      }
    }
    SessionEnd()
    {
      Message()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 2000;
        Text = lang2(["FINE"],["E N D E"]);
      }
    }
    Block()
    {
      Message()
      {
        Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
        Text = lang2(["PREMI UN TASTO PER CONTINUARE."],["Zum Weitermachen drücken Sie bitte eine beliebige Taste!"]);
      }
    }
    BlockEnd()
    {
      Message()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 2000;
        Text = "P A U S A";
      }
    }
    Trial( TrialCounter, Art, LetterCombination, Repetition, Feedback.CorrectCode, TextParagraph.ResponseTime, TextParagraph.ResponseCode)
    {
      FixationMark()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 400;
      }
      ClearScreen:a()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 100;
      }
      TextParagraph()
      {
        Timer = de.pxlab.pxl.TimerCodes.LIMITED_RESPONSE_TIMER;
        Duration = 3000;
        ResponseSet = [37, 39];
	FontSize = 128;
      }
      Feedback()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1000;
        ResponseParameter = "Trial.TextParagraph.ResponseCode";
        CorrectText = lang2(["BRAVO! CORRETTO"],["Richtig!"]);
        FalseText = lang2(["OPS! SBAGLIATO"],["Falsch!"]);
        Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
      }
      ClearScreen:b()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1500;
      }
    }
  }
  Factors()
  {
    IndependentFactor( LetterCombination)
    {
      FactorLevel( 1);
      FactorLevel( 2);
      FactorLevel( 3);
      FactorLevel( 4);
      FactorLevel( 5);
      FactorLevel( 6);
    }
    IndependentFactor( Repetition)
    {
      FactorLevel( 1);
      FactorLevel( 2);
      FactorLevel( 3);
      FactorLevel( 4);
      FactorLevel( 5);
      FactorLevel( 6);
      FactorLevel( 7);
      FactorLevel( 8);
    }
    ConditionTable( LetterCombination, Repetition, Trial.TextParagraph.Text)
    {
      Condition( 1, 1, "AA");
      Condition( 1, 2, "TT");
      Condition( 1, 3, "DD");
      Condition( 1, 4, "EE");
      Condition( 1, 5, "aa");
      Condition( 1, 6, "tt");
      Condition( 1, 7, "dd");
      Condition( 1, 8, "ee");
      Condition( 2, 1, "Aa");
      Condition( 2, 2, "Tt");
      Condition( 2, 3, "Ee");
      Condition( 2, 4, "Dd");
      Condition( 2, 5, "aA");
      Condition( 2, 6, "tT");
      Condition( 2, 7, "dD");
      Condition( 2, 8, "eE");
      Condition( 3, 1, "AE");
      Condition( 3, 2, "EA");
      Condition( 3, 3, "ae");
      Condition( 3, 4, "ea");
      Condition( 3, 5, "TD");
      Condition( 3, 6, "DT");
      Condition( 3, 7, "td");
      Condition( 3, 8, "dt");
      Condition( 4, 1, "AT");
      Condition( 4, 2, "TA");
      Condition( 4, 3, "at");
      Condition( 4, 4, "ta");
      Condition( 4, 5, "At");
      Condition( 4, 6, "aT");
      Condition( 4, 7, "tA");
      Condition( 4, 8, "Ta");
      Condition( 5, 1, "TE");
      Condition( 5, 2, "ET");
      Condition( 5, 3, "te");
      Condition( 5, 4, "et");
      Condition( 5, 5, "Te");
      Condition( 5, 6, "tE");
      Condition( 5, 7, "Et");
      Condition( 5, 8, "eT");
      Condition( 6, 1, "AD");
      Condition( 6, 2, "DA");
      Condition( 6, 3, "ad");
      Condition( 6, 4, "da");
      Condition( 6, 5, "Ad");
      Condition( 6, 6, "aD");
      Condition( 6, 7, "Da");
      Condition( 6, 8, "dA");
    }
  }
  Procedure()
  {
    Session()
    {
      Block()
      {
        Trial( ?, 1, 1, 1, 0, ?, ?);
        Trial( ?, 1, 1, 2, 0, ?, ?);
        Trial( ?, 1, 1, 3, 0, ?, ?);
        Trial( ?, 1, 1, 4, 0, ?, ?);
        Trial( ?, 1, 1, 5, 0, ?, ?);
        Trial( ?, 1, 1, 6, 0, ?, ?);
        Trial( ?, 1, 1, 7, 0, ?, ?);
        Trial( ?, 1, 1, 8, 0, ?, ?);
        Trial( ?, 2, 2, 1, 0, ?, ?);
        Trial( ?, 2, 2, 2, 0, ?, ?);
        Trial( ?, 2, 2, 3, 0, ?, ?);
        Trial( ?, 2, 2, 4, 0, ?, ?);
        Trial( ?, 2, 2, 5, 0, ?, ?);
        Trial( ?, 2, 2, 6, 0, ?, ?);
        Trial( ?, 2, 2, 7, 0, ?, ?);
        Trial( ?, 2, 2, 8, 0, ?, ?);
        Trial( ?, 3, 3, 1, 0, ?, ?);
        Trial( ?, 3, 3, 2, 0, ?, ?);
        Trial( ?, 3, 3, 3, 0, ?, ?);
        Trial( ?, 3, 3, 4, 0, ?, ?);
        Trial( ?, 4, 3, 5, 0, ?, ?);
        Trial( ?, 4, 3, 6, 0, ?, ?);
        Trial( ?, 4, 3, 7, 0, ?, ?);
        Trial( ?, 4, 3, 8, 0, ?, ?);
        Trial( ?, 5, 4, 1, 1, ?, ?);
        Trial( ?, 5, 4, 2, 1, ?, ?);
        Trial( ?, 5, 4, 3, 1, ?, ?);
        Trial( ?, 5, 4, 4, 1, ?, ?);
        Trial( ?, 5, 4, 5, 1, ?, ?);
        Trial( ?, 5, 4, 6, 1, ?, ?);
        Trial( ?, 5, 4, 7, 1, ?, ?);
        Trial( ?, 5, 4, 8, 1, ?, ?);
        Trial( ?, 5, 5, 1, 1, ?, ?);
        Trial( ?, 5, 5, 2, 1, ?, ?);
        Trial( ?, 5, 5, 3, 1, ?, ?);
        Trial( ?, 5, 5, 4, 1, ?, ?);
        Trial( ?, 5, 5, 5, 1, ?, ?);
        Trial( ?, 5, 5, 6, 1, ?, ?);
        Trial( ?, 5, 5, 7, 1, ?, ?);
        Trial( ?, 5, 5, 8, 1, ?, ?);
        Trial( ?, 5, 6, 1, 1, ?, ?);
        Trial( ?, 5, 6, 2, 1, ?, ?);
        Trial( ?, 5, 6, 3, 1, ?, ?);
        Trial( ?, 5, 6, 4, 1, ?, ?);
        Trial( ?, 5, 6, 5, 1, ?, ?);
        Trial( ?, 5, 6, 6, 1, ?, ?);
        Trial( ?, 5, 6, 7, 1, ?, ?);
        Trial( ?, 5, 6, 8, 1, ?, ?);
      }
    }
  }
}
