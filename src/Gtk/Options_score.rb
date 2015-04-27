class Options_score

	def Options_score.afficher(fenetre, langue)

	padding = 40
	
	#Création des boutons
	boutonRetour = Gtk::Button.new(langue.retour)

	#Création d'une vbox
	vbox = Gtk::VBox.new(false,10)

	ary = ModelScore.getScoreArrayByJoueur($joueur.id)

	ary.each do |x|
		message = "Score: " + x.calculScore.to_s + 
			", grille: " + x.grille.to_s + 
			", mode: " + x.mode.to_s + 
			", chrono: " + x.chrono.to_s +
			", nombre de pause: " + x.nb_pause.to_s + 
			", nombre de undo: " + x.nb_undo.to_s
		lbl = Gtk::Label.new(message)
		vbox.pack_start(lbl, false, false, padding)
	end

	boutonRetour.signal_connect('clicked'){
		fenetre.remove(vbox)
		Options.afficher(fenetre, langue)
	}

	# Ajout des boutons a la vbox
	vbox.pack_start(boutonRetour, false, false, padding)

	fenetre.add(vbox)
	fenetre.show_all
	
	end
	
end
