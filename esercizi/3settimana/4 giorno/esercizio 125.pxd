Experiment()
{
  Context()
  {
    AssignmentGroup()
    {
      new LetterCombination = 1;
      new Repetition = 1;
      new Art = 1;
      SubjectCode = "pxlab125";
      DataFileTrialFormat = "%SubjectCode% %TrialCounter% %Art% %Trial.TextParagraph.ResponseTime% %Trial.Feedback.Response%";
      ExperimentName = lang2("Same/Different Tasks (Posner & Mitchell, 1967)", "Gleich/verschieden-Aufgaben (Posner & Mitchell, 1967)");
    }
    Session()
    {
      Instruction()
      {
        Text = lang2(["UGUALE O DIVERSO.\n \nVEDRAI DUE LETTERE.\n \nIL TUO COMPITO E' DECIDERE SE SONO DELLO STESSO TIPO (VOCALI, CONSONANTI)\n \nUSA IL TASTO FRECCIA DI SINISTRA, PER INDICARE CHE SONO ENTRAMBE O VOCALI O CONSONANTI.\n \nUSA IL TASTO FRECCIA DI DESTRA SE RICONOSCI CHE SONO UNA VOCALE E UNA CONSONANTE.\n \nPREMI UN TASTO PER CONTINUARE."],
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
      Condition( 1, 2, "CC");
      Condition( 1, 3, "GG");
      Condition( 1, 4, "EE");
      Condition( 1, 5, "aa");
      Condition( 1, 6, "cc");
      Condition( 1, 7, "gg");
      Condition( 1, 8, "ee");
      Condition( 2, 1, "Aa");
      Condition( 2, 2, "Cc");
      Condition( 2, 3, "Ee");
      Condition( 2, 4, "Gg");
      Condition( 2, 5, "aA");
      Condition( 2, 6, "cC");
      Condition( 2, 7, "gG");
      Condition( 2, 8, "eE");
      Condition( 3, 1, "AE");
      Condition( 3, 2, "EA");
      Condition( 3, 3, "ae");
      Condition( 3, 4, "ea");
      Condition( 3, 5, "CG");
      Condition( 3, 6, "GC");
      Condition( 3, 7, "cg");
      Condition( 3, 8, "gc");
      Condition( 4, 1, "AC");
      Condition( 4, 2, "CA");
      Condition( 4, 3, "ac");
      Condition( 4, 4, "ca");
      Condition( 4, 5, "Ac");
      Condition( 4, 6, "aC");
      Condition( 4, 7, "cA");
      Condition( 4, 8, "Ca");
      Condition( 5, 1, "CE");
      Condition( 5, 2, "EC");
      Condition( 5, 3, "ce");
      Condition( 5, 4, "ec");
      Condition( 5, 5, "Ce");
      Condition( 5, 6, "cE");
      Condition( 5, 7, "Ec");
      Condition( 5, 8, "eC");
      Condition( 6, 1, "AG");
      Condition( 6, 2, "GA");
      Condition( 6, 3, "ag");
      Condition( 6, 4, "ga");
      Condition( 6, 5, "Ag");
      Condition( 6, 6, "aG");
      Condition( 6, 7, "Ga");
      Condition( 6, 8, "gA");
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
