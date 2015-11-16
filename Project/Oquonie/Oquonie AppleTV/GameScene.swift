
//  Created by Devine Lu Linvega on 2015-11-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import SpriteKit

class GameScene: SKScene
{
	var time:NSTimer!

    override func didMoveToView(view: SKView)
	{
		start()
		time = NSTimer.scheduledTimerWithTimeInterval(0.025, target: self, selector: "_fixedUpdate", userInfo: nil, repeats: true)
    }
	
	func start()
	{
		_addStage()
		_addPlayer()
		_addSpellbook()
		_addDialog()
		
		// debug
		spellbook.addSpell(Wizard(x:0,y:0,spell:Personas.nephtaline))
		spellbook.addSpell(Wizard(x:0,y:0,spell:Personas.nephtaline))
	}
	
	func _addPlayer()
	{
		player.position = CGPoint(x: 0, y: 0)
		player.zPosition = 90
		stage.events_root.addChild(player)
		stage.enter(world.all[38])
	}
	
	func _addStage()
	{
		stage.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - 150)
		addChild(stage)
	}
	
	func _addSpellbook()
	{
		spellbook.position = CGPoint(x: 0, y: (CGRectGetMidY(self.frame) * 2) - (templates.spell.height + 20) )
		spellbook.zPosition = 900
		self.addChild(spellbook)
	}
	
	func _addDialog()
	{
		dialog.position = CGPoint(x: 0, y: (CGRectGetMidY(self.frame) * 2) - (templates.spell.height + 20) )
		dialog.zPosition = 9000
		self.addChild(dialog)
	}

    override func update(currentTime: CFTimeInterval)
	{
		super.update(currentTime)
		stage._fixedUpdate()
	}
	
	override func _fixedUpdate()
	{
		
	}
}
