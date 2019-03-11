Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab84";
    }

    Session() {
      Instruction() {
        Text = ["PAROLA O NON PAROLA?",
		" ",
		"VEDRAI DUE SEQUENZE DI LETTERE. UNA E' UNA PAROLA VERA E L'ALTRA NON E' UNA PAROLA. DEVI TROVARE LA PAROLA VERA E CLICCARE IL TASTO DESTRO DEL MOUSE SE LA PAROLA VERA E' A DESTRA, IL TASTO DI SINISTRA SE LA PAROLA VERA E' A SINISTRA. CERCA DI ESSERE PIU' VELOCE CHE PUOI.",
		" ",
		"PREMI UN TASTO PER PARTIRE!"];  
      }
    }

    SessionEnd() {
      SessionEndMessage();
    }

    Trial(TextParagraphMultiple.Text, Feedback.CorrectCode, Feedback.Response, TextParagraphMultiple.ResponseTime) {
      FixationMark() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 50;
      }
      FixationMark:B() {
        Timer = de.pxlab.pxl.TimerCodes.NO_TIMER;
      }
      TextParagraphMultiple() {
	Overlay = de.pxlab.pxl.OverlayCodes.JOIN;
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
	ResponseSet = [1,3];
	FontSize = idiv(screenWidth(),15);
	ReferencePoint = [de.pxlab.pxl.PositionReferenceCodes.BASE_RIGHT, 
		de.pxlab.pxl.PositionReferenceCodes.BASE_LEFT];
	LocationX = arrayOf2(-screenWidth()/16.4, screenWidth()/16.4);
	LocationY = 25;
      }
      Feedback() {
	ResponseParameter = "Trial.TextParagraphMultiple.ResponseCode";
	CorrectText = "Corretto!\n %Trial.TextParagraphMultiple.ResponseTime@i% ms";
	FalseText = "Ops! Sbagliato!";
        Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
	Duration = 1000;
      }
    }
  }

  Procedure() {
    Session() {
      Block() {
	Trial(["pane", "pone"], 0, ?, ?);
	Trial(["festa", "tesfa"], 0, ?, ?);
	Trial(["coro", "goro"], 0, ?, ?);
	Trial(["orto", "ordo"], 0, ?, ?);
	Trial(["preda", "breda"], 0, ?, ?);
	Trial(["tela", "fela"], 0, ?, ?);
	Trial(["lato", "lado"], 0, ?, ?);
	Trial(["furia", "vuria"], 0, ?, ?);
	Trial(["merce", "nerce"], 0, ?, ?);
	Trial(["pugno", "puno"], 0, ?, ?);
	Trial(["vetro", "fetro"], 0, ?, ?);
	Trial(["frase", "trase"], 0, ?, ?);
	Trial(["tetto", "teto"], 0, ?, ?);
	Trial(["seno", "semu"], 0, ?, ?);
	Trial(["febbre", "vebbre"], 0, ?, ?);
	Trial(["furto", "vurto"], 1, ?, ?);
	Trial(["sate", "sede"], 1, ?, ?);
	Trial(["cora", "gara"], 1, ?, ?);
	Trial(["vlima", "clima"], 1, ?, ?);
	Trial(["ritno", "ritmo"], 1, ?, ?);
	Trial(["volla", "folla"], 1, ?, ?);
	Trial(["darba", "barba"], 1, ?, ?);
	Trial(["bonte", "ponte"], 1, ?, ?);
	Trial(["meve", "neve"], 1, ?, ?);
	Trial(["vame", "fame"], 1, ?, ?);
	Trial(["arba", "erba"], 1, ?, ?);
	Trial(["vretta", "fretta"], 1, ?, ?);
	Trial(["sona", "zona"], 1, ?, ?);
	Trial(["rifa", "riva"], 1, ?, ?);
	Trial(["lidro", "libro"], 1, ?, ?);
      }
    }
  }
}
