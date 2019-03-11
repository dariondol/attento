Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab14";
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
	LocationX = arrayOf2(-screenWidth()/8.2, screenWidth()/8.2);
	LocationY = 25;
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
	Trial(["episodio", "APIsodio"], 0, ?, ?);
	Trial(["edicola", "ADIcola"], 0, ?, ?);
	Trial(["origine", "oriGGine"], 0, ?, ?);
	Trial(["cadavere", "GAdavere"], 0, ?, ?);
	Trial(["elefante", "ALEfante"], 0, ?, ?);
	Trial(["galleria", "gaLerie"], 0, ?, ?);
	Trial(["immagine", "imaGine"], 0, ?, ?);
	Trial(["incudine", "inGUdine"], 0, ?, ?);
	Trial(["indagine", "indaCIne"], 0, ?, ?);
	Trial(["maionese", "NAIOnese"], 0, ?, ?);
	Trial(["officina", "AFFIcina"], 0, ?, ?);
	Trial(["ombelico", "OMDElico"], 0, ?, ?);
	Trial(["ospedale", "ospeBALE"], 0, ?, ?);
	Trial(["pericolo", "BERIcolo"], 0, ?, ?);
	Trial(["piramide", "BIRAramide"], 0, ?, ?);
	Trial(["DATTEsimo", "battesimo"], 1, ?, ?);
	Trial(["ASIgnolo", "usignolo"], 1, ?, ?);
	Trial(["reliGGione", "religione"], 1, ?, ?);
	Trial(["occiBEnte", "occidente"], 1, ?, ?);
	Trial(["orienFALE", "orientale"], 1, ?, ?);
	Trial(["oriSSONTE", "orizzonte"], 1, ?, ?);
	Trial(["BONTEfice", "pontefice"], 1, ?, ?);
	Trial(["RUPInetto", "rubinetto"], 1, ?, ?);
	Trial(["sacerPOTE", "sacerdote"], 1, ?, ?);
	Trial(["FARFAruga", "tartaruga"], 1, ?, ?);
	Trial(["FERTIgine", "vertigine"], 1, ?, ?);
	Trial(["LAPIrinto", "labirinto"], 1, ?, ?);
	Trial(["INTAresse", "interesse"], 1, ?, ?);
	Trial(["GHELSOmino", "gelsomino"], 1, ?, ?);
	Trial(["muniCIBIO", "municipio"], 1, ?, ?);
      }
    }
  }
}
