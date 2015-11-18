
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

var templates = Templates()
let world = World()
let player = Player()
let stage = Stage()
let spellbook = Spellbook()
let dialog = Dialog()
var parallaxFront:SKSpriteNode!
var parallaxBack:SKSpriteNode!
let dialogs = Dialogs()

enum Progress : Int
{
	case tutorial = 1
	case part1 = 2
	case part2 = 3
}

enum Types
{
	case tile
	case step
	case wall
}

struct Templates
{
	let floor:CGSize = CGSize(width: 200, height: 141)
	let step:CGSize = CGSize(width: 200, height: 141)
	let wall:CGSize = CGSize(width: 200, height: 281)
	let player:CGSize = CGSize(width: 200, height: 281)
	let spell:CGSize = CGSize(width: 120, height: 120)
	var stage:CGPoint = CGPoint()
	let dialog:CGSize = CGSize(width: 640, height: 390)
}

enum Letter
{
	case nemedique
	case nestorine
	case nephtaline
	case necomedre
	case neomine
	case nastazie
	case door
	case teleport
	case correct
	case incorrect
	case unlocked
	case locked
	case help
	case sound
	case guide
	case inside
	case outside
	case key
	case friend
	case foe
	case confusion1
	case confusion2
	case confusion3
	case document
	case pillar	
}

enum Orientation
{
	case l
	case r
}

enum Direction
{
	case f
	case b
}

enum States
{
	case stand
	case walk
	case warp
}

enum Personas
{
	case photocopier
	case necomedre
	case nephtaline
	case neomine
	case nestorine
	case nemedique
	case nastazie
	case photobooth
	case catfishbird
}

enum Soundtrack
{
	case none
	case necomedre
	case lobby
	case nemedique
	case nephtaline
	case neomine
	case quiet
	case nestorine
	case nastazie
	case glitch
	case photobooth
	case endless
	case nepturne
	case pillar
	case warp
	case purgatory
	case play
}

enum Theme
{
	case white
	case black
	case red
	case void
	case pest
}

func distanceBetweenTwoPoints(a:CGPoint,b:CGPoint)->CGFloat
{
	return sqrt(pow(a.x-b.x,2)+pow(a.y-b.y,2));
}

func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat
{
	return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
}

func textureWithName(imageName:String) -> SKTexture!
{
	var image:UIImage!
	var texture:SKTexture!
	
	if UIImage(named: imageName) != nil {
		image = UIImage(named: imageName)!
		texture = SKTexture(image: image!)
	}
	else {
		print("! not found \(imageName)")
	}
	return texture
}

var pillar_necomedre:Pillar = Pillar(x: 0, y: 0)
var pillar_nephtaline:Pillar = Pillar(x: 0, y: 0)
var pillar_neomine:Pillar = Pillar(x: 0, y: 0)
var pillar_nestorine:Pillar = Pillar(x: 0, y: 0)
var pillar_nemedique:Pillar = Pillar(x: 0, y: 0)
var pillar_nastazie:Pillar = Pillar(x: 0, y: 0)
