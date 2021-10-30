global.__heirMap = ds_list_create();
function __heirMapUpdate()
{
	for ( var i=0; i<ds_list_size(global.__heirMap); i++ )
	{
		with ( global.__heirMap[| i] )
		{
			for ( var h=0; h<ds_list_size(__heirs); h++ )
			{
				with ( __heirs[| h] ) 
				{
					var d1 = point_direction(xstart, ystart, other.xstart, other.ystart) + other.image_angle;
					var d2 = point_distance(xstart, ystart, other.xstart, other.ystart);
					
					x = other.x - dcos(d1) * d2;
					y = other.y + dsin(d1) * d2;
					image_angle = other.image_angle + image_angle_heir;
				}
			}
		}
	}
}
function __heirMapClear()
{
	for ( var i=0; i<ds_list_size(global.__heirMap); i++ )
	{	
		ds_list_destroy(global.__heirMap[|i].__heirs);
	}
	ds_list_clear(global.__heirMap);	
}

function heir_add_to(obj) 
{
	if ( !variable_instance_exists(obj, "__heirs") )
	{
		if ( !instance_exists(objHeirController) )
		{
			instance_create_depth(0,0,0,objHeirController);
		}
		with ( obj )
		{
			__heirs = ds_list_create();
			global.__heirMap[| ds_list_size(global.__heirMap)] = obj;
		}
	}
	image_angle_heir = image_angle;
	__heritagePos = ds_list_size(obj.__heirs);
	obj.__heirs[| ds_list_size(obj.__heirs)] = id;
}
function heir_add(obj)
{
	with ( obj )
	{
		heir_add_to(other);	
	}
}
function heir_remove_from(obj)
{
	with ( obj )
	{
		ds_list_delete(__heirs, other.__heritagePos);
	}
}
function heir_remove(obj)
{
	with ( obj )
	{
		heir_remove_from(other);
	}
}