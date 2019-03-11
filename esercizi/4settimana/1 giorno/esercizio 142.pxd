Experiment(SubjectCode, SubjectGroup) {

  Context() {

    AssignmentGroup() {
      ExperimentName = "E' una parola!";
      new Related = 1;
      new Word = 1;
      SubjectCode = "pxlab142";
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
        Trial("trota", "pesce", 1, 1, ?, ?);
        Trial("arige", "cassa", 2, 1, ?, ?);
        Trial("cassa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("pesce", "trota", 1, 1, ?, ?);
        Trial("arige", "cassa", 2, 1, ?, ?);
        Trial("cassa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("rapa", "pane", 1, 1, ?, ?);
        Trial("huse", "rapa", 2, 1, ?, ?);
        Trial("pane", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("gazza", "zuffa", 1, 1, ?, ?);
        Trial("arige", "gazza", 2, 1, ?, ?);
        Trial("zuffa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("tuta", "lato", 1, 1, ?, ?);
        Trial("arige", "tuta", 2, 1, ?, ?);
        Trial("lato", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("fata", "tela", 1, 1, ?, ?);
        Trial("arige", "fata", 2, 1, ?, ?);
        Trial("tela", "perte", 1, 2, ?, ?);
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
        Trial("garbo", "tordo", 1, 1, ?, ?);
        Trial("arige", "garbo", 2, 1, ?, ?);
        Trial("tordo", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("ritmo", "norma", 1, 1, ?, ?);
        Trial("arige", "ritmo", 2, 1, ?, ?);
        Trial("norma", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("barba", "marmo", 1, 1, ?, ?);
        Trial("huse", "barba", 2, 1, ?, ?);
        Trial("marmo", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("fogna", "gogna", 1, 1, ?, ?);
        Trial("arige", "fogna", 2, 1, ?, ?);
        Trial("gogna", "perte", 1, 2, ?, ?);
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
        Trial("cedro", "corvo", 1, 1, ?, ?);
        Trial("huse", "cedro", 2, 1, ?, ?);
        Trial("corvo", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("fetta", "muffa", 1, 1, ?, ?);
        Trial("arige", "fetta", 2, 1, ?, ?);
        Trial("muffa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
    }

    // Session for SessionGroup B
    Session() {
       Block( ?, 0, 0) {
        Trial("trota", "pesce", 1, 1, ?, ?);
        Trial("arige", "cassa", 2, 1, ?, ?);
        Trial("cassa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("pesce", "trota", 1, 1, ?, ?);
        Trial("arige", "cassa", 2, 1, ?, ?);
        Trial("cassa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("rapa", "pane", 1, 1, ?, ?);
        Trial("huse", "rapa", 2, 1, ?, ?);
        Trial("pane", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("gazza", "zuffa", 1, 1, ?, ?);
        Trial("arige", "gazza", 2, 1, ?, ?);
        Trial("zuffa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
	Block( ?, 0, 0) {
        Trial("tuta", "lato", 1, 1, ?, ?);
        Trial("arige", "tuta", 2, 1, ?, ?);
        Trial("lato", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("fata", "tela", 1, 1, ?, ?);
        Trial("arige", "fata", 2, 1, ?, ?);
        Trial("tela", "perte", 1, 2, ?, ?);
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
        Trial("garbo", "tordo", 1, 1, ?, ?);
        Trial("arige", "garbo", 2, 1, ?, ?);
        Trial("tordo", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
	Trial("ritmo", "norma", 1, 1, ?, ?);
        Trial("arige", "ritmo", 2, 1, ?, ?);
        Trial("norma", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
      Block( ?, 0, 0) {
        Trial("barba", "marmo", 1, 1, ?, ?);
        Trial("huse", "barba", 2, 1, ?, ?);
        Trial("marmo", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("fogna", "gogna", 1, 1, ?, ?);
        Trial("arige", "fogna", 2, 1, ?, ?);
        Trial("gogna", "perte", 1, 2, ?, ?);
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
        Trial("cedro", "corvo", 1, 1, ?, ?);
        Trial("huse", "cedro", 2, 1, ?, ?);
        Trial("corvo", "gerben", 1, 2, ?, ?);
        Trial("huse", "gerben", 2, 2, ?, ?);
	Trial("fetta", "muffa", 1, 1, ?, ?);
        Trial("arige", "fetta", 2, 1, ?, ?);
        Trial("muffa", "perte", 1, 2, ?, ?);
        Trial("arige", "betle", 2, 2, ?, ?);
      }
    }
  }
}
