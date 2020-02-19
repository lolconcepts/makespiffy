require 'test_helper'

class SpiffyTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spiffy_task = spiffy_tasks(:one)
  end

  test "should get index" do
    get spiffy_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_spiffy_task_url
    assert_response :success
  end

  test "should create spiffy_task" do
    assert_difference('SpiffyTask.count') do
      post spiffy_tasks_url, params: { spiffy_task: { active: @spiffy_task.active, description: @spiffy_task.description, name: @spiffy_task.name, value: @spiffy_task.value } }
    end

    assert_redirected_to spiffy_task_url(SpiffyTask.last)
  end

  test "should show spiffy_task" do
    get spiffy_task_url(@spiffy_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_spiffy_task_url(@spiffy_task)
    assert_response :success
  end

  test "should update spiffy_task" do
    patch spiffy_task_url(@spiffy_task), params: { spiffy_task: { active: @spiffy_task.active, description: @spiffy_task.description, name: @spiffy_task.name, value: @spiffy_task.value } }
    assert_redirected_to spiffy_task_url(@spiffy_task)
  end

  test "should destroy spiffy_task" do
    assert_difference('SpiffyTask.count', -1) do
      delete spiffy_task_url(@spiffy_task)
    end

    assert_redirected_to spiffy_tasks_url
  end
end
