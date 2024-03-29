import Foundation

protocol GameProtocol {
    associatedtype ItPlateau : IteratorProtocol
    
    // Création d'une Game : initialise un plateau de 16 cases ne contenant pas de pièces, initialise les deux joueurs : un qui choisit la pièce et l'autre qui pose la pièce
    // init : -> Game
    // crée un itérator "ItPlateau" pour parcourir les cases du plateau
    // pieceAvailable = true
    init()
    
    // fonction au démarage du jeu, demande aux joueurs de choisir si ils jouent avec les règles simples(quarto sur ligne, colonne ou diagonale) ou complexes(simples plus quarto sur une carré de 4 cases)
    // defineRules: Game -> Game
    mutating func defineRules()

    // échange les rôles des deux joueurs, le joueur ayant choisi la pièce devient le joueur qui pose la pièce et inversement
    // Les joueurs échangent de rôle à chaque tour
    // changePlayer: Game -> Game
    // Post : si tourJ1 alors tourJ1 = false sinon tourJ1 = true
    mutating func changePlayer()

    // Regarde si c'est le tour de j1
    // tourJ1 : Game -> Bool
    // Post : renvoie true si c'est le tour du joueur 1, false si c'est le tour du joueur 2
    func tourJ1() -> Bool

    // Demande à un joueur de choisir une pièce à donner à l'autre joueur
    // choosePiece: Game -> Game x Piece
    // Pre: La pièce n'est pas encore posée sur le plateau, il reste des pièces à poser
    // Récupère la pièce choisie par le joueur et la donne à l'autre joueur afin qu'il la pose sur le plateau
    mutating func choosePiece()

    // Demande au joueur où placer la pièce(que l'autre joueur lui a donné) sur le plateau, vérifie que la case est libre et place la pièce
    // setPieceAt : Piece x Game -> Game x Piece
    // Post: place la pièce sur le plateau à l'endroit indiqué par l'utilisateur
    mutating func setPieceAt()

    // Regarde si il y a un quarto effectué, après la pose d'une pièce, en fonction des règles choisies au début de la partie et s'il y a un quarto
    // quarto: Game x Piece -> Bool
    // Il y a quarto si, sur une même ligne, colonne ou diagonale, les 4 pièces ont une caractéristique identique avec les règles simples
    // Il y a quarto si, sur une même ligne, colonne, diagonale ou carré, les 4 pièces ont une caractéristique identique avec les règles complexes
    func quarto() -> Bool

    // vérifie s'il y a un quarto (ou non) sur la ligne après la pose d'une pièce
    // quartoLigne : Game x Piece -> Bool
    // Post : Bool = true si quarto sur la ligne, false sinon
    func quartoLigne() -> Bool

    // vérifie s'il y a un quarto (ou non) sur la colone après la pose d'une pièce
    // quartoCol : Game x Piece -> Bool
    // Post : Bool = true si quarto sur la colonne, false sinon
    func quartoCol() -> Bool

    // vérifie s'il y a un quarto (ou non) sur la diagonale après la pose d'une pièce
    // quartoDiag: Game x Piece -> Bool
    // Post : Bool = true si quarto sur la diagonale, false sinon
    func quartoDiag() -> Bool

    // vérifie s'il y a un quarto (ou non) dans un carré après la pose d'une pièce
    // quartoCarre: Game x Piece -> Bool
    // Post : Bool = true si quarto sur un carré, false sinon
    func quartoCarre() -> Bool

    // Est-ce qu'il reste des pièces à jouer ?
    // pieceAvailable : Game -> Bool
    // Post : true si il reste des pièces, false sinon
    var pieceAvailable : Bool { get }

    // makeIterator: Game -> ItPlateau
    // crée un itérateur sur le plateau pour le parcourir dans l'ordre des cases
    func makeIterator() -> ItPlateau
    
}