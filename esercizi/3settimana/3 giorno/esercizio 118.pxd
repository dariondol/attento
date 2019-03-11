Experiment(SubjectCode, SubjectGroup) {

  Context() {

    AssignmentGroup() {
      ExperimentName = "E' una parola!";
      new Related = 1;
      new Word = 1;
      SubjectCode = "pxlab118";
      SkipBoundingBlockDisplays = 0;
    }

    Session() {
      Instruction() {
        Text = ["Lexical Decision",
		" ",
        	"Devi dire se la sequenza di lettere che vedi per ultima è una parola", 
                "subito prima che la sequenza di lettere compaia tu vedrai una parola seguita da una serie di croci. Devi ignorare la prima parola e le croci e concentrarti solo sull'ultima sequenza di lettere.",
		" ",
		"Se la sequenza di lettere è una parola premi il tasto di sinistra del mouse.",
		"Se la sequenza di lettere non è una parola premi il tasto di destra del mouse.",
		" ",
		"Premi un tasto per iniziare."];  
      }
    }

    Block(BlockCounter, TrialCounter, StoreData) {
    }

    Trial(Message:Prime.Text, Message:Target.Text, Related, Word, ResponseCode, ResponseTime) {
    // Trial(Message:Prime.Text, Message:Target.Text, Related, Word, Message:Wait.ResponsePosition, ResponseTime) {
      // FixationMark() {
      Message:Fixation() {
	Text = "+";
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1000;
	Color = White;
      }
      Message:Prime() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 60;
	Color = White;
	LocationX = -screenWidth()/2;
        LocationY = screenHeight()/7;
      }
      Message:Mask() {
	Text = "xxxxxxxxxx";
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 100;
	Color = White;
	LocationX = -screenWidth()/2;
        LocationY = screenHeight()/7;
      }
      ClearScreen() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 500 - Trial.Message:Mask.Duration - Trial.Message:Prime.Duration;
      }
      Message:Target() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER 
                | de.pxlab.pxl.TimerCodes.START_RESPONSE_TIMER;
        Duration = 600;
	Color = White;
	LocationX = -screenWidth()/2;
        LocationY = screenHeight()/7;
      }
      Message:Wait() {
	Text = "?";
        Timer = de.pxlab.pxl.TimerCodes.LIMITED_RESPONSE_TIMER 
                | de.pxlab.pxl.TimerCodes.STOP_RESPONSE_TIMER;
	Duration = 2000;
	Color = White;
        // Left button (code=1) translates to index 1 and corresponds to FactorLevel 'word'
        // Right button (code=3) translates to index 2 and corresponds to FactorLevel 'non-word'
        ResponseSet = [0, 1, 3];
      }

      Feedback() {
	ResponseParameter = "Trial.Message:Wait.ResponseCode";
	CorrectCode = Word;
	CorrectText = "Corretto!\n %ResponseTime@i% ms";
	Color = Red; 
	FalseText = (Trial.Message:Wait.ResponseCode == de.pxlab.pxl.ResponseCodes.TIME_OUT)? "Time out": "ops! sbagliato\n %ResponseTime@i% ms";
        Color = White; 
	Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
	Duration = 1000;
	Visible = 1;
      }

    }
  }

  Factors() {
    CovariateFactor(SubjectGroup, SessionGroup) {
      FactorLevel("A", 1);
      FactorLevel("B", 2);
    }
    IndependentFactor(Related) {
      FactorLevel(1);
      FactorLevel(2);
    }
    IndependentFactor(Word) {
      FactorLevel(1);
      FactorLevel(2);
    }
    DependentFactor(ResponseTime);
    DependentFactor(Trial.Feedback.Response);
  }

  Procedure() {

    // Session for SessionGroup A
    Session() {
      Block( ?, 0, 0) {
        Trial("edicola", "episodio", 1, 1, ?, ?);
        Trial("arige", "edicola", 2, 1, ?, ?);
        Trial("episodio", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("elefante", "tartaruga", 1, 1, ?, ?);
        Trial("arige", "elefante", 2, 1, ?, ?);
        Trial("tartaruga", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("officina", "ombelico", 1, 1, ?, ?);
        Trial("huse", "officina", 2, 1, ?, ?);
        Trial("ombelico", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("sacerdote", "pontefice", 1, 1, ?, ?);
        Trial("arige", "sacerdote", 2, 1, ?, ?);
        Trial("pontefice", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("orizzonte", "orientale", 1, 1, ?, ?);
        Trial("arige", "orizzonte", 2, 1, ?, ?);
        Trial("orientale", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("rubinetto", "labirinto", 1, 1, ?, ?);
        Trial("arige", "rubinetto", 2, 1, ?, ?);
        Trial("labirinto", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("usignolo", "gelsomino", 1, 1, ?, ?);
        Trial("huse", "usignolo", 2, 1, ?, ?);
        Trial("gelsomino", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("battesimo", "religione", 1, 1, ?, ?);
        Trial("arige", "battesimo", 2, 1, ?, ?);
        Trial("religione", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("municipio", "piramide", 1, 1, ?, ?);
        Trial("arige", "municipio", 2, 1, ?, ?);
        Trial("piramide", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("gelsomino", "maionese", 1, 1, ?, ?);
        Trial("arige", "gelsomino", 2, 1, ?, ?);
        Trial("maionese", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("pericolo", "incudine", 1, 1, ?, ?);
        Trial("huse", "pericolo", 2, 1, ?, ?);
        Trial("incudine", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("ospedale", "battesimo", 1, 1, ?, ?);
        Trial("arige", "ospedale", 2, 1, ?, ?);
        Trial("battesimo", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("cadavere", "immagine", 1, 1, ?, ?);
        Trial("arige", "cadavere", 2, 1, ?, ?);
        Trial("immagine", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("galleria", "edicola", 1, 1, ?, ?);
        Trial("arige", "galleria", 2, 1, ?, ?);
        Trial("edicola", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("interesse", "sacerdote", 1, 1, ?, ?);
        Trial("huse", "interesse", 2, 1, ?, ?);
        Trial("sacerdote", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("pericolo", "piramide", 1, 1, ?, ?);
        Trial("arige", "pericolo", 2, 1, ?, ?);
        Trial("piramide", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
    }

    // Session for SessionGroup B
    Session() {
       Block( ?, 0, 0) {
        Trial("edicola", "episodio", 1, 1, ?, ?);
        Trial("arige", "edicola", 2, 1, ?, ?);
        Trial("episodio", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("elefante", "tartaruga", 1, 1, ?, ?);
        Trial("arige", "elefante", 2, 1, ?, ?);
        Trial("tartaruga", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("officina", "ombelico", 1, 1, ?, ?);
        Trial("huse", "officina", 2, 1, ?, ?);
        Trial("ombelico", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("sacerdote", "pontefice", 1, 1, ?, ?);
        Trial("arige", "sacerdote", 2, 1, ?, ?);
        Trial("pontefice", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("orizzonte", "orientale", 1, 1, ?, ?);
        Trial("arige", "orizzonte", 2, 1, ?, ?);
        Trial("orientale", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("rubinetto", "labirinto", 1, 1, ?, ?);
        Trial("arige", "rubinetto", 2, 1, ?, ?);
        Trial("labirinto", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("usignolo", "gelsomino", 1, 1, ?, ?);
        Trial("huse", "usignolo", 2, 1, ?, ?);
        Trial("gelsomino", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("battesimo", "religione", 1, 1, ?, ?);
        Trial("arige", "battesimo", 2, 1, ?, ?);
        Trial("religione", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("municipio", "piramide", 1, 1, ?, ?);
        Trial("arige", "municipio", 2, 1, ?, ?);
        Trial("piramide", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("gelsomino", "maionese", 1, 1, ?, ?);
        Trial("arige", "gelsomino", 2, 1, ?, ?);
        Trial("maionese", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("pericolo", "incudine", 1, 1, ?, ?);
        Trial("huse", "pericolo", 2, 1, ?, ?);
        Trial("incudine", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("ospedale", "battesimo", 1, 1, ?, ?);
        Trial("arige", "ospedale", 2, 1, ?, ?);
        Trial("battesimo", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("cadavere", "immagine", 1, 1, ?, ?);
        Trial("arige", "cadavere", 2, 1, ?, ?);
        Trial("immagine", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("galleria", "edicola", 1, 1, ?, ?);
        Trial("arige", "galleria", 2, 1, ?, ?);
        Trial("edicola", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("interesse", "sacerdote", 1, 1, ?, ?);
        Trial("huse", "interesse", 2, 1, ?, ?);
        Trial("sacerdote", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("pericolo", "piramide", 1, 1, ?, ?);
        Trial("arige", "pericolo", 2, 1, ?, ?);
        Trial("piramide", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
    }
  }
}
