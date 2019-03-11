Experiment(SubjectCode, SubjectGroup) {

  Context() {

    AssignmentGroup() {
      ExperimentName = "E' una parola!";
      new Related = 1;
      new Word = 1;
      SubjectCode = "pxlab156";
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
        Duration = 40;
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
        Duration = 400;
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
        Trial("pomata", "bossolo", 1, 1, ?, ?);
        Trial("arige", "pomata", 2, 1, ?, ?);
        Trial("bossolo", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("forfora", "valvola", 1, 1, ?, ?);
        Trial("arige", "forfora", 2, 1, ?, ?);
        Trial("valvola", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("carciofo", "ciliegia", 1, 1, ?, ?);
        Trial("huse", "carciofo", 2, 1, ?, ?);
        Trial("ciliegia", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("giaguaro", "pinguino", 1, 1, ?, ?);
        Trial("arige", "giaguaro", 2, 1, ?, ?);
        Trial("pinguino", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("befana", "tariffa", 1, 1, ?, ?);
        Trial("arige", "befana", 2, 1, ?, ?);
        Trial("tariffa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("catino", "cofano", 1, 1, ?, ?);
        Trial("arige", "catino", 2, 1, ?, ?);
        Trial("cofano", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("bava", "pala", 1, 1, ?, ?);
        Trial("huse", "bava", 2, 1, ?, ?);
        Trial("pala", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("rovo", "rata", 1, 1, ?, ?);
        Trial("arige", "rovo", 2, 1, ?, ?);
        Trial("rata", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("lumaca", "ortica", 1, 1, ?, ?);
        Trial("arige", "lumaca", 2, 1, ?, ?);
        Trial("ortica", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("zattera", "zanzara", 1, 1, ?, ?);
        Trial("arige", "zattera", 2, 1, ?, ?);
        Trial("zanzara", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("geranio", "cipresso", 1, 1, ?, ?);
        Trial("huse", "geranio", 2, 1, ?, ?);
        Trial("cipresso", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("ovatta", "cometa", 1, 1, ?, ?);
        Trial("arige", "ovatta", 2, 1, ?, ?);
        Trial("cometa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("tipo", "topo", 1, 1, ?, ?);
        Trial("arige", "tipo", 2, 1, ?, ?);
        Trial("topo", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("atrio", "fretta", 1, 1, ?, ?);
        Trial("arige", "atrio", 2, 1, ?, ?);
        Trial("fretta", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("canguro", "gattino", 1, 1, ?, ?);
        Trial("huse", "canguro", 2, 1, ?, ?);
        Trial("gattino", "gerben", 1, 2, ?, ?);
        Trial("huse", "cratere", 2, 2, ?, ?);
	Trial("martire", "muffa", 1, 1, ?, ?);
        Trial("arige", "martire", 2, 1, ?, ?);
        Trial("cratere", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
    }

    // Session for SessionGroup B
    Session() {
        Block( ?, 0, 0) {
        Trial("pomata", "bossolo", 1, 1, ?, ?);
        Trial("arige", "pomata", 2, 1, ?, ?);
        Trial("bossolo", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("forfora", "valvola", 1, 1, ?, ?);
        Trial("arige", "forfora", 2, 1, ?, ?);
        Trial("valvola", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("carciofo", "ciliegia", 1, 1, ?, ?);
        Trial("huse", "carciofo", 2, 1, ?, ?);
        Trial("ciliegia", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("giaguaro", "pinguino", 1, 1, ?, ?);
        Trial("arige", "giaguaro", 2, 1, ?, ?);
        Trial("pinguino", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("befana", "tariffa", 1, 1, ?, ?);
        Trial("arige", "befana", 2, 1, ?, ?);
        Trial("tariffa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("catino", "cofano", 1, 1, ?, ?);
        Trial("arige", "catino", 2, 1, ?, ?);
        Trial("cofano", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("bava", "pala", 1, 1, ?, ?);
        Trial("huse", "bava", 2, 1, ?, ?);
        Trial("pala", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("rovo", "rata", 1, 1, ?, ?);
        Trial("arige", "rovo", 2, 1, ?, ?);
        Trial("rata", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("lumaca", "ortica", 1, 1, ?, ?);
        Trial("arige", "lumaca", 2, 1, ?, ?);
        Trial("ortica", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("zattera", "zanzara", 1, 1, ?, ?);
        Trial("arige", "zattera", 2, 1, ?, ?);
        Trial("zanzara", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("geranio", "cipresso", 1, 1, ?, ?);
        Trial("huse", "geranio", 2, 1, ?, ?);
        Trial("cipresso", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("ovatta", "cometa", 1, 1, ?, ?);
        Trial("arige", "ovatta", 2, 1, ?, ?);
        Trial("cometa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("tipo", "topo", 1, 1, ?, ?);
        Trial("arige", "tipo", 2, 1, ?, ?);
        Trial("topo", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("atrio", "fretta", 1, 1, ?, ?);
        Trial("arige", "atrio", 2, 1, ?, ?);
        Trial("fretta", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("canguro", "gattino", 1, 1, ?, ?);
        Trial("huse", "canguro", 2, 1, ?, ?);
        Trial("gattino", "gerben", 1, 2, ?, ?);
        Trial("huse", "cratere", 2, 2, ?, ?);
	Trial("martire", "muffa", 1, 1, ?, ?);
        Trial("arige", "martire", 2, 1, ?, ?);
        Trial("cratere", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
    }
  }
}
