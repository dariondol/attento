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
      SubjectCode = "pxlab69";
    }
    Session()
    {
      Instruction()
      {
        Text = lang2(["Leggi e individua la lettera", 
		" ", 
		"Sullo schermo appariranno velocemente o una lettera o una parola.", 
		"Poi sullo schermo appariranno due lettere e devi selezionare quella che era presente nella parola apparsa prima (o la lettera comparsa prima).", 
		"Seleziona la lettera corretta cliccando il tasto destro o sinistro del mouse corrispondente.", 
		" ", 
		"Premi un tasto per far comparire la crocetta sullo schermo e premi ancora per inziare il test."],
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
        Duration = 400;
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
        Width = 500;
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
        Width = 500;
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
        Height = 200;
      }
      LetterMatrix:Feedback()
      {
        Timer = de.pxlab.pxl.TimerCodes.NO_TIMER;
        NumberOfRows = 1;
        NumberOfColumns = 10;
        Width = 500;
        Height = 200;
        FontSize = 60;
	Letters = Trial.MaskedLetterMatrix.Letters;
	JustInTime = 1;
      }
      Feedback()
      {
        Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
        ResponseParameter = "Trial.LetterMatrix.ResponseCode";
        CorrectText = lang2("Corretto!", "Richtig!");
        FalseText = lang2("Sbagliato!", "Falsch!");
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
	Trial(?, 3, "abisso", 1, "sz", left, ?, ?);
	Trial(?, 2, "bicchiere", 1, "bd", left, ?, ?);
	Trial(?, 1, " h    ", 1, "hn", left, ?, ?);
	Trial(?, 3, "canguro", 1, "ia", right, ?, ?);
	Trial(?, 2, "cuore", 1, "qc", right, ?, ?);
	Trial(?, 1, " k    ", 1, "xk", right, ?, ?);

	Trial(?, 3, "drago", 2, "rb", left, ?, ?);
	Trial(?, 2, "estate", 2, "tf", left, ?, ?);
	Trial(?, 1, "  z   ", 2, "zs", left, ?, ?);
	Trial(?, 3, "fantasma", 2, "Wm", right, ?, ?);
	Trial(?, 2, "giacca", 2, "dg", right, ?, ?);
	Trial(?, 1, "  h   ", 2, "Wh", right, ?, ?);

	Trial(?, 3, "insetto", 3, "ia", left, ?, ?);
	Trial(?, 2, "libro", 3, "rd", left, ?, ?);
	Trial(?, 1, "   n  ", 3, "nm", left, ?, ?);
	Trial(?, 3, "mucca", 3, "nm", right, ?, ?);
	Trial(?, 2, "natura", 3, "ct", right, ?, ?);
	Trial(?, 1, "   h  ", 3, "mh", right, ?, ?);

	Trial(?, 3, "ombelico", 4, "lf", left, ?, ?);
	Trial(?, 2, "pericolo", 4, "ra", left, ?, ?);
	Trial(?, 1, "ruggine", 4, "gm", left, ?, ?);
	Trial(?, 3, "spiaggia", 4, "lp", right, ?, ?);
	Trial(?, 2, "taverna", 4, "bv", right, ?, ?);
	Trial(?, 1, "usignolo", 4, "go", right, ?, ?);
      }

      Block(1) {

	/* 3 x 1 x 2 = 240 Trials */

	Trial(?, 3, "voce", 1, "va", left, ?, ?);
	Trial(?, 2, "zuppa", 1, "zs", left, ?, ?);
	Trial(?, 1, " o    ", 1, "ou", left, ?, ?);
	Trial(?, 3, "acqua", 1, "iu", right, ?, ?);
	Trial(?, 2, "banana", 1, "mn", right, ?, ?);
	Trial(?, 1, "cavallo", 1, "ea", right, ?, ?);
	Trial(?, 3, "ciliegia", 1, "dg", right, ?, ?);
	Trial(?, 2, "donna", 1, "mn", right, ?, ?);
	Trial(?, 1, " i    ", 1, "ai", right, ?, ?);
	Trial(?, 3, "elmo", 1, "en", left, ?, ?);
	Trial(?, 2, "favola", 1, "oe", left, ?, ?);
	Trial(?, 1, "gelsomino", 1, "iz", left, ?, ?);
	Trial(?, 3, "inverno", 1, "rb", left, ?, ?);
	Trial(?, 2, "lanterna", 1, "lm", left, ?, ?);
	Trial(?, 1, "memoria", 1, "mn", left, ?, ?);
	Trial(?, 3, "nazione", 1, "zs", left, ?, ?);
	Trial(?, 2, "orizzonte", 1, "nd", left, ?, ?);
	Trial(?, 1, "pinguino", 1, "ia", left, ?, ?);
	Trial(?, 3, "rumore", 1, "au", right, ?, ?);
	Trial(?, 2, "simbolo", 1, "nm", right, ?, ?);
	Trial(?, 1, " u    ", 1, "au", right, ?, ?);
	Trial(?, 3, "tetto", 1, "ei", left, ?, ?);
	Trial(?, 2, "uragano", 1, "um", left, ?, ?);
	Trial(?, 1, "vantaggio", 1, "ae", left, ?, ?);
	Trial(?, 3, "zucchero", 1, "cv", left, ?, ?);
	Trial(?, 2, "angolo", 1, "ai", left, ?, ?);
	Trial(?, 1, "antenna", 1, "ao", left, ?, ?);
	Trial(?, 3, "bocca", 1, "bd", left, ?, ?);
	Trial(?, 2, "batuffolo", 1, "fe", left, ?, ?);
	Trial(?, 1, " a    ", 1, "ao", left, ?, ?);
	Trial(?, 3, "colore", 1, "ao", right, ?, ?);
	Trial(?, 2, "camomilla", 1, "nm", right, ?, ?);
	Trial(?, 1, " o    ", 1, "ao", right, ?, ?);
	Trial(?, 3, "epoca", 1, "ps", left, ?, ?);
	Trial(?, 2, "episodio", 1, "sq", left, ?, ?);
	Trial(?, 1, " r    ", 1, "rs", left, ?, ?);
	Trial(?, 3, "fratello", 1, "ie", right, ?, ?);
	Trial(?, 2, "fastidio", 1, "zs", right, ?, ?);
	Trial(?, 1, " e    ", 1, "ae", right, ?, ?);
	Trial(?, 3, "giudice", 1, "au", right, ?, ?);
	Trial(?, 2, "gabbiano", 1, "db", right, ?, ?);
	Trial(?, 1, " i    ", 1, "ai", right, ?, ?);
	Trial(?, 3, "immagine", 1, "ui", right, ?, ?);
	Trial(?, 2, "imbuto", 1, "au", right, ?, ?);
	Trial(?, 1, " u    ", 1, "ou", right, ?, ?);
	Trial(?, 3, "luogo", 1, "au", right, ?, ?);
	Trial(?, 2, "lepre", 1, "dp", right, ?, ?);
	Trial(?, 1, " o    ", 1, "io", right, ?, ?);
	Trial(?, 3, "minestra", 1, "ao", left, ?, ?);
	Trial(?, 2, "mandorla", 1, "nv", left, ?, ?);
	Trial(?, 1, " a    ", 1, "au", left, ?, ?);
	Trial(?, 3, "negozio", 1, "sz", right, ?, ?);
	Trial(?, 2, "nuca", 1, "bu", right, ?, ?);
	Trial(?, 1, " u    ", 1, "au", right, ?, ?);
	Trial(?, 3, "ortica", 1, "eo", right, ?, ?);
	Trial(?, 2, "orto", 1, "sr", right, ?, ?);
	Trial(?, 1, " o    ", 1, "ao", right, ?, ?);
	Trial(?, 3, "parola", 1, "pd", left, ?, ?);
	Trial(?, 2, "pigiama", 1, "mw", left, ?, ?);
	Trial(?, 1, " a    ", 1, "au", left, ?, ?);

	Trial(?, 3, "principe", 2, "cd", left, ?, ?);
	Trial(?, 2, "parrucca", 2, "rs", left, ?, ?);
	Trial(?, 1, "  e   ", 2, "eu", left, ?, ?);
	Trial(?, 3, "ragno", 2, "fg", right, ?, ?);
	Trial(?, 2, "rabbia", 2, "gr", right, ?, ?);
	Trial(?, 1, "  g   ", 2, "fg", right, ?, ?);
	Trial(?, 3, "silenzio", 2, "mn", right, ?, ?);
	Trial(?, 2, "serpente", 2, "bp", right, ?, ?);
	Trial(?, 1, "  h   ", 2, "fh", right, ?, ?);
	Trial(?, 3, "tappeto", 2, "tv", left, ?, ?);
	Trial(?, 2, "treno", 2, "ri", left, ?, ?);
	Trial(?, 1, "  l   ", 2, "li", left, ?, ?);
	Trial(?, 3, "vino", 2, "ou", left, ?, ?);
	Trial(?, 2, "vernice", 2, "ea", left, ?, ?);
	Trial(?, 1, "  m   ", 2, "mp", left, ?, ?);
	Trial(?, 3, "zanzara", 2, "zs", left, ?, ?);
	Trial(?, 2, "zona", 2, "au", left, ?, ?);
	Trial(?, 1, "  a   ", 2, "au", left, ?, ?);
	Trial(?, 3, "flanella", 2, "il", right, ?, ?);
	Trial(?, 2, "fiducia", 2, "li", right, ?, ?);
	Trial(?, 1, "  l   ", 2, "il", right, ?, ?);
	Trial(?, 3, "arte", 2, "tl", left, ?, ?);
	Trial(?, 2, "atleta", 2, "lp", left, ?, ?);
	Trial(?, 1, "  l   ", 2, "lt", left, ?, ?);
	Trial(?, 3, "brivido", 2, "bp", left, ?, ?);
	Trial(?, 2, "barba", 2, "ae", left, ?, ?);
	Trial(?, 1, "  e   ", 2, "es", left, ?, ?);
	Trial(?, 3, "cane", 2, "ns", left, ?, ?);
	Trial(?, 2, "capra", 2, "rs", left, ?, ?);
	Trial(?, 1, "  r   ", 2, "rs", left, ?, ?);
	Trial(?, 3, "corallo", 2, "ia", right, ?, ?);
	Trial(?, 2, "coltello", 2, "ae", right, ?, ?);
	Trial(?, 1, "  i   ", 2, "ai", right, ?, ?);
	Trial(?, 3, "padre", 2, "rs", left, ?, ?);
	Trial(?, 2, "pagina", 2, "pr", left, ?, ?);
	Trial(?, 1, "  l   ", 2, "ls", left, ?, ?);
	Trial(?, 3, "pugile", 2, "kp", right, ?, ?);
	Trial(?, 2, "polvere", 2, "sr", right, ?, ?);
	Trial(?, 1, "  t   ", 2, "st", right, ?, ?);
	Trial(?, 3, "goccia", 2, "hg", right, ?, ?);
	Trial(?, 2, "galera", 2, "hg", right, ?, ?);
	Trial(?, 1, "  h   ", 2, "gh", right, ?, ?);
	Trial(?, 3, "cronaca", 2, "gc", right, ?, ?);
	Trial(?, 2, "chiesa", 2, "dc", right, ?, ?);
	Trial(?, 1, "  s   ", 2, "ls", right, ?, ?);
	Trial(?, 3, "diamante", 2, "pd", right, ?, ?);
	Trial(?, 2, "denaro", 2, "sd", right, ?, ?);
	Trial(?, 1, "  s   ", 2, "ps", right, ?, ?);
	Trial(?, 3, "fulmine", 2, "uo", left, ?, ?);
	Trial(?, 2, "famiglia", 2, "ae", left, ?, ?);
	Trial(?, 1, "  o   ", 2, "ou", left, ?, ?);
	Trial(?, 3, "grandine", 2, "lg", right, ?, ?);
	Trial(?, 2, "ginocchio", 2, "lg", right, ?, ?);
	Trial(?, 1, "  l   ", 2, "gl", right, ?, ?);
	Trial(?, 3, "lumaca", 2, "nm", right, ?, ?);
	Trial(?, 2, "lato", 2, "st", right, ?, ?);
	Trial(?, 1, "  t   ", 2, "st", right, ?, ?);
	Trial(?, 3, "pentola", 2, "nr", left, ?, ?);
	Trial(?, 2, "palazzo", 2, "zr", left, ?, ?);
	Trial(?, 1, "  n   ", 2, "nr", left, ?, ?);
	Trial(?, 3, "rospo", 2, "uo", right, ?, ?);
	Trial(?, 2, "ritmo", 2, "hi", right, ?, ?);
	Trial(?, 1, "  i   ", 2, "hi", right, ?, ?);
      }

    }
  }
}




