/** Word superiority effect after Reicher (1969) and Wheeler (1970).
A sequence of letters is presented and followed by a mask.  A single
position is marked and the subject has to report the letter at the
marked position. Two alternatives are presented as a choice set.  The
subject has to select the correct letter by using the left/right
cursor keys.  */



Experiment()
{
  Context()
  {
    AssignmentGroup()
    {
      new Wortart = 0;
      new left = 1;
      new right = 3;
      ExperimentName = lang2("Word Superiority Effect (Reicher, 1969; Wheeler, 1970)", "Wortüberlegenheitseffekt (Reicher, 1969; Wheeler, 1970)");
      TrialFactor = 1;
      SubjectCode = "pxlab78";
    }
    Session()
    {
      Instruction()
      {
        Text = lang2(["Leggi e individua la lettera NP", 
		" ",  
		"Sullo schermo appariranno velocemente o una lettera o una parola inventata.", 
		"Poi sullo schermo appariranno due lettere e devi selezionare quella che era presente nella parola apparsa prima (o la lettera comparsa prima).", 
		"Seleziona la lettera corretta cliccando il tasto destro o sinistro del mouse corrispondente.", 
		" ", 
		"Premi un tasto per far comparire la crocetta sullo schermo e premi ancora per inziare il test"],
        	["Der Wortüberlegenheitseffekt", 
		" ", 
		"Beim Erscheinen des Fixationskreuzes bitte eine Taste drücken um den Durchgang zu starten.", 
		"Es erscheint dann einer oder mehrere Buchstaben, der/die nur für sehr kurze Zeit zu sehen ist/sind.", 
		"Eine Position ist markiert. Von den zwei Buchstaben zur Auswahl, die danach kommen, wählen Sie mit der linken/rechten Maustaste den linken/rechten als den, der an der markierten Position stand.", 
		" ", 
		"Zum Start bitte eine beliebige Taste drücken!"]);
      }
    }

    SessionEnd()
    {
      SessionEndMessage();
    }

    Block(StoreData) {
      BlockStartMessage();
    }

    BlockEnd() {
      BlockEndMessage();
    }


    Trial( TrialCounter, 
	Wortart, 
	MaskedLetterMatrix.Letters, 
	MaskedLetterMatrix.CuePosition, 
	LetterMatrix.Letters, 
	Feedback.CorrectCode, 
	LetterMatrix.ResponseCode, 
	Feedback.Response)
    {
      FixationMark()
      {
        Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
      }
      ClearScreen:wait1()
      {
        Timer = de.pxlab.pxl.TimerCodes.VS_CLOCK_TIMER;
        Duration = 500;
      }
      MaskedLetterMatrix()
      {
        Timer = de.pxlab.pxl.TimerCodes.VS_CLOCK_TIMER;
        Duration = 300;

	CueDelayTimer = de.pxlab.pxl.TimerCodes.VS_CLOCK_TIMER;
        CueDelayDuration = 0;
        CueOrientation = 0;
        LocationX = -screenWidth()/3;
        LocationY = screenHeight()/7;
        CueSize = idiv(screenWidth(),80);
        CueDistance = idiv(screenWidth(),20);

	MaskTimer = de.pxlab.pxl.TimerCodes.VS_CLOCK_TIMER;
        MaskDuration = 1000;

        NumberOfRows = 1;
        NumberOfColumns = 10;
        LocationX = -screenWidth()/3;
        LocationY = screenHeight()/7;
        Width = 300;
        Height = 200;
        FontSize = 40;
        MaskLetters = "ASDFGHJKMDEW";
      }
      LetterMatrix()
      {
        NumberOfRows = 1;
        NumberOfColumns = 2;
        LocationX = -screenWidth()/3;
        LocationY = screenHeight()/7;
        FontSize = 40;
        Width = 100;
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
        Height = 200;
      }
      LetterMatrix:Feedback()
      {
        Timer = de.pxlab.pxl.TimerCodes.NO_TIMER;
        NumberOfRows = 1;
        NumberOfColumns = 6;
        Width = 300;
        Height = 200;
        FontSize = 40;
	Letters = Trial.MaskedLetterMatrix.Letters;
	JustInTime = 1;
      }
      Feedback()
      {
        Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
        ResponseParameter = "Trial.LetterMatrix.ResponseCode";
        CorrectText = lang2("Corretto!", "Richtig!");
        FalseText = lang2("Ops! Sbagliato!", "Falsch!");
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 600;
	Overlay = de.pxlab.pxl.OverlayCodes.JOIN;
	LocationY = 100;
        Visible = 1;
      }
      ClearScreen:close()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 400;
      }
    }
  }

  Procedure() {
  
    Session() {

      Block(0) {
	Trial(?, 3, "abfall", 1, "bn", left, ?, ?);
	Trial(?, 2, "abauso", 1, "bn", left, ?, ?);
	Trial(?, 1, " b    ", 1, "bn", left, ?, ?);
	Trial(?, 3, "hammel", 1, "ia", right, ?, ?);
	Trial(?, 2, "waahvj", 1, "ia", right, ?, ?);
	Trial(?, 1, " a    ", 1, "ia", right, ?, ?);

	Trial(?, 3, "grippe", 2, "iu", left, ?, ?);
	Trial(?, 2, "aaiuso", 2, "ie", left, ?, ?);
	Trial(?, 1, "  i   ", 2, "iu", left, ?, ?);
	Trial(?, 3, "gehalt", 2, "wh", right, ?, ?);
	Trial(?, 2, "wahhvj", 2, "mh", right, ?, ?);
	Trial(?, 1, "  h   ", 2, "wh", right, ?, ?);

	Trial(?, 3, "daunen", 3, "nm", left, ?, ?);
	Trial(?, 2, "aaunso", 3, "nm", left, ?, ?);
	Trial(?, 1, "   n  ", 3, "nm", left, ?, ?);
	Trial(?, 3, "weiher", 3, "lh", right, ?, ?);
	Trial(?, 2, "wahhvj", 3, "lh", right, ?, ?);
	Trial(?, 1, "   h  ", 3, "lh", right, ?, ?);

	Trial(?, 3, "fliege", 4, "gs", left, ?, ?);
	Trial(?, 2, "aaungo", 4, "gs", left, ?, ?);
	Trial(?, 1, "    g ", 4, "gs", left, ?, ?);
	Trial(?, 3, "kreide", 4, "sd", right, ?, ?);
	Trial(?, 2, "wahvdj", 4, "sd", right, ?, ?);
	Trial(?, 1, "    d ", 4, "sd", right, ?, ?);
      }

      Block(1) {

	/* 3 x 1 x 2 = 6 Trials */

	Trial(?, 3, "zocker", 1, "ou", left, ?, ?);
	Trial(?, 2, "joqmor", 1, "ou", left, ?, ?);
	Trial(?, 1, " o    ", 1, "ou", left, ?, ?);
	Trial(?, 3, "hummel", 1, "iu", right, ?, ?);
	Trial(?, 2, "lunmww", 1, "iu", right, ?, ?);
	Trial(?, 1, " u    ", 1, "iu", right, ?, ?);
	Trial(?, 3, "lippen", 1, "ai", right, ?, ?);
	Trial(?, 2, "yinspu", 1, "ai", right, ?, ?);
	Trial(?, 1, " i    ", 1, "ai", right, ?, ?);
	Trial(?, 3, "pillen", 1, "io", left, ?, ?);
	Trial(?, 2, "miebtv", 1, "io", left, ?, ?);
	Trial(?, 1, " i    ", 1, "io", left, ?, ?);
	Trial(?, 3, "zocker", 1, "ou", left, ?, ?);
	Trial(?, 2, "uodxbg", 1, "ou", left, ?, ?);
	Trial(?, 1, " o    ", 1, "ou", left, ?, ?);
	Trial(?, 3, "gatter", 1, "ai", left, ?, ?);
	Trial(?, 2, "yahobx", 1, "ai", left, ?, ?);
	Trial(?, 1, " a    ", 1, "ai", left, ?, ?);
	Trial(?, 3, "hummer", 1, "au", right, ?, ?);
	Trial(?, 2, "pukhar", 1, "eu", right, ?, ?);
	Trial(?, 1, " u    ", 1, "au", right, ?, ?);
	Trial(?, 3, "tasche", 1, "ai", left, ?, ?);
	Trial(?, 2, "yaxknw", 1, "ai", left, ?, ?);
	Trial(?, 1, " a    ", 1, "ai", left, ?, ?);
	Trial(?, 3, "bahnen", 1, "ao", left, ?, ?);
	Trial(?, 2, "qaregg", 1, "ao", left, ?, ?);
	Trial(?, 1, " a    ", 1, "ao", left, ?, ?);
	Trial(?, 3, "rachen", 1, "ao", left, ?, ?);
	Trial(?, 2, "valeeln", 1, "ao", left, ?, ?);
	Trial(?, 1, " a    ", 1, "ao", left, ?, ?);
	Trial(?, 3, "wochen", 1, "ao", right, ?, ?);
	Trial(?, 2, "toekul", 1, "ao", right, ?, ?);
	Trial(?, 1, " o    ", 1, "ao", right, ?, ?);
	Trial(?, 3, "irland", 1, "rs", left, ?, ?);
	Trial(?, 2, "vrncpe", 1, "rs", left, ?, ?);
	Trial(?, 1, " r    ", 1, "rs", left, ?, ?);
	Trial(?, 3, "seiten", 1, "ae", right, ?, ?);
	Trial(?, 2, "penlka", 1, "ie", right, ?, ?);
	Trial(?, 1, " e    ", 1, "ae", right, ?, ?);
	Trial(?, 3, "filter", 1, "ai", right, ?, ?);
	Trial(?, 2, "jiemuo", 1, "ai", right, ?, ?);
	Trial(?, 1, " i    ", 1, "ai", right, ?, ?);
	Trial(?, 3, "tusche", 1, "iu", right, ?, ?);
	Trial(?, 2, "muornr", 1, "iu", right, ?, ?);
	Trial(?, 1, " u    ", 1, "iu", right, ?, ?);
	Trial(?, 3, "kosten", 1, "io", right, ?, ?);
	Trial(?, 2, "tobllu", 1, "io", right, ?, ?);
	Trial(?, 1, " o    ", 1, "io", right, ?, ?);
	Trial(?, 3, "kammer", 1, "au", left, ?, ?);
	Trial(?, 2, "lajhyj", 1, "au", left, ?, ?);
	Trial(?, 1, " a    ", 1, "au", left, ?, ?);
	Trial(?, 3, "zungen", 1, "au", right, ?, ?);
	Trial(?, 2, "sulnml", 1, "au", right, ?, ?);
	Trial(?, 1, " u    ", 1, "au", right, ?, ?);
	Trial(?, 3, "wochen", 1, "ao", right, ?, ?);
	Trial(?, 2, "lojjbt", 1, "ao", right, ?, ?);
	Trial(?, 1, " o    ", 1, "ao", right, ?, ?);
	Trial(?, 3, "zangen", 1, "au", left, ?, ?);
	Trial(?, 2, "ganqna", 1, "au", left, ?, ?);
	Trial(?, 1, " a    ", 1, "au", left, ?, ?);

	Trial(?, 3, "stelle", 2, "eu", left, ?, ?);
	Trial(?, 2, "jqemir", 2, "eu", left, ?, ?);
	Trial(?, 1, "  e   ", 2, "eu", left, ?, ?);
	Trial(?, 3, "umgang", 2, "fg", right, ?, ?);
	Trial(?, 2, "lngmww", 2, "fg", right, ?, ?);
	Trial(?, 1, "  g   ", 2, "fg", right, ?, ?);
	Trial(?, 3, "umhang", 2, "fh", right, ?, ?);
	Trial(?, 2, "ynhspu", 2, "fh", right, ?, ?);
	Trial(?, 1, "  h   ", 2, "fh", right, ?, ?);
	Trial(?, 3, "teller", 2, "li", left, ?, ?);
	Trial(?, 2, "molbtv", 2, "li", left, ?, ?);
	Trial(?, 1, "  l   ", 2, "li", left, ?, ?);
	Trial(?, 3, "kumbel", 2, "mp", left, ?, ?);
	Trial(?, 2, "udmxbg", 2, "mp", left, ?, ?);
	Trial(?, 1, "  m   ", 2, "mp", left, ?, ?);
	Trial(?, 3, "fracht", 2, "au", left, ?, ?);
	Trial(?, 2, "yhaobx", 2, "au", left, ?, ?);
	Trial(?, 1, "  a   ", 2, "au", left, ?, ?);
	Trial(?, 3, "selten", 2, "il", right, ?, ?);
	Trial(?, 2, "pklhar", 2, "il", right, ?, ?);
	Trial(?, 1, "  l   ", 2, "il", right, ?, ?);
	Trial(?, 3, "halden", 2, "lt", left, ?, ?);
	Trial(?, 2, "yxlknw", 2, "lt", left, ?, ?);
	Trial(?, 1, "  l   ", 2, "lt", left, ?, ?);
	Trial(?, 3, "wieten", 2, "es", left, ?, ?);
	Trial(?, 2, "qreegg", 2, "es", left, ?, ?);
	Trial(?, 1, "  e   ", 2, "es", left, ?, ?);
	Trial(?, 3, "karten", 2, "rs", left, ?, ?);
	Trial(?, 2, "vlroln", 2, "rs", left, ?, ?);
	Trial(?, 1, "  r   ", 2, "rs", left, ?, ?);
	Trial(?, 3, "klippe", 2, "ai", right, ?, ?);
	Trial(?, 2, "teikul", 2, "ai", right, ?, ?);
	Trial(?, 1, "  i   ", 2, "ai", right, ?, ?);
	Trial(?, 3, "ablage", 2, "ls", left, ?, ?);
	Trial(?, 2, "vnlcpe", 2, "ls", left, ?, ?);
	Trial(?, 1, "  l   ", 2, "ls", left, ?, ?);
	Trial(?, 3, "mittel", 2, "st", right, ?, ?);
	Trial(?, 2, "pntlka", 2, "st", right, ?, ?);
	Trial(?, 1, "  t   ", 2, "st", right, ?, ?);
	Trial(?, 3, "abhant", 2, "gh", right, ?, ?);
	Trial(?, 2, "jehmao", 2, "gh", right, ?, ?);
	Trial(?, 1, "  h   ", 2, "gh", right, ?, ?);
	Trial(?, 3, "ansage", 2, "ls", right, ?, ?);
	Trial(?, 2, "misrnr", 2, "ls", right, ?, ?);
	Trial(?, 1, "  s   ", 2, "ls", right, ?, ?);
	Trial(?, 3, "kassel", 2, "ps", right, ?, ?);
	Trial(?, 2, "tbsllu", 2, "ps", right, ?, ?);
	Trial(?, 1, "  s   ", 2, "ps", right, ?, ?);
	Trial(?, 3, "glocke", 2, "ou", left, ?, ?);
	Trial(?, 2, "ljohyj", 2, "ou", left, ?, ?);
	Trial(?, 1, "  o   ", 2, "ou", left, ?, ?);
	Trial(?, 3, "erlebt", 2, "gl", right, ?, ?);
	Trial(?, 2, "sllnml", 2, "gl", right, ?, ?);
	Trial(?, 1, "  l   ", 2, "gl", right, ?, ?);
	Trial(?, 3, "untere", 2, "st", right, ?, ?);
	Trial(?, 2, "ljtjbt", 2, "st", right, ?, ?);
	Trial(?, 1, "  t   ", 2, "st", right, ?, ?);
	Trial(?, 3, "kunden", 2, "nr", left, ?, ?);
	Trial(?, 2, "gnnqna", 2, "nr", left, ?, ?);
	Trial(?, 1, "  n   ", 2, "nr", left, ?, ?);
	Trial(?, 3, "deinen", 2, "hi", right, ?, ?);
	Trial(?, 2, "neined", 2, "hi", right, ?, ?);
	Trial(?, 1, "  i   ", 2, "hi", right, ?, ?);
      }

    }
  }
}




