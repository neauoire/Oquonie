
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Red : Event
{
	var isSeen:Bool = false
	
	override init(x:Int,y:Int)
	{
		super.init(x: x, y: y)
		updateSprite("event.redghost.1.png")
	}
	
	override func onRoomEnter()
	{
		if isSeen == true { return }
		player.lock()
		NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "disapear", userInfo: nil, repeats: false)
	}
	
	override func collide()
	{
		player.walk(x, destination_y:y)
	}
	
	func disapear()
	{
		let action_move = SKAction.moveToY(sprite.position.y + (templates.floor.height * 0.5), duration: 3)
		let action_fade = SKAction.fadeAlphaTo(0, duration: 3)
		let action_group = SKAction.group([action_move,action_fade])
		
		action_move.timingMode = .EaseInEaseOut
		
		sprite.runAction(action_group, completion:{ self.isSeen = true ; player.unlock() })
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}