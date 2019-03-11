Experiment()
{
  Context()
  {
    AssignmentGroup()
    {
      new LetterCombination = 1;
      new Repetition = 1;
      new Art = 1;
      SubjectCode = "pxlab38";
      DataFileTrialFormat = "%SubjectCode% %TrialCounter% %Art% %Trial.TextParagraph.ResponseTime% %Trial.Feedback.Response%";
      ExperimentName = lang2("Same/Different Tasks (Posner & Mitchell, 1967)", "Gleich/verschieden-Aufgaben (Posner & Mitchell, 1967)");
    }
    Session()
    {
      Instruction()
      {
        Text = lang2(["UGUALE O DIVERSO.\n \nVEDRAI DUE LETTERE.\n \nIL TUO COMPITO E' DECIDERE SE SONO DELLO STESSO TIPO (VOCALI, CONSONANTI)\n \nUSA IL TASTO FRECCIA DI SINISTRA, PER INDICARE CHE SONO ENTRAMBE O VOCALI O CONSONANTI.\n \nUSA IL TASTO FRECCIA DI DESTRA SE RICONOSCI CHE SONO UNA VOCALE E UNA CONSONANTE.\n \n ATTENTO! SE RISPONDI TROPPO TARDI LA RISPOSTA è CONSIDERATA ERRATA!\n \nPREMI UN TASTO PER CONTINUARE."],
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
        Text = lang2(["F I N E"],["E N D E"]);
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
        Duration = 300;
      }
      TextParagraph()
      {
        Timer = de.pxlab.pxl.TimerCodes.LIMITED_RESPONSE_TIMER;
        Duration = 1000;
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
      Condition( 1, 2, "BB");
      Condition( 1, 3, "DD");
      Condition( 1, 4, "EE");
      Condition( 1, 5, "aa");
      Condition( 1, 6, "bb");
      Condition( 1, 7, "dd");
      Condition( 1, 8, "ee");
      Condition( 2, 1, "Aa");
      Condition( 2, 2, "Bb");
      Condition( 2, 3, "Ee");
      Condition( 2, 4, "Dd");
      Condition( 2, 5, "aA");
      Condition( 2, 6, "bB");
      Condition( 2, 7, "dD");
      Condition( 2, 8, "eE");
      Condition( 3, 1, "AE");
      Condition( 3, 2, "EA");
      Condition( 3, 3, "ae");
      Condition( 3, 4, "ea");
      Condition( 3, 5, "BD");
      Condition( 3, 6, "DB");
      Condition( 3, 7, "bd");
      Condition( 3, 8, "db");
      Condition( 4, 1, "AB");
      Condition( 4, 2, "BA");
      Condition( 4, 3, "ab");
      Condition( 4, 4, "ba");
      Condition( 4, 5, "Ab");
      Condition( 4, 6, "aB");
      Condition( 4, 7, "bA");
      Condition( 4, 8, "Ba");
      Condition( 5, 1, "BE");
      Condition( 5, 2, "EB");
      Condition( 5, 3, "be");
      Condition( 5, 4, "eb");
      Condition( 5, 5, "Be");
      Condition( 5, 6, "bE");
      Condition( 5, 7, "Eb");
      Condition( 5, 8, "eB");
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
