require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson = lessons(:one)
  end

  test "should get index" do
    get lessons_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_url
    assert_response :success
  end

  test "should create lesson" do
    assert_difference('Lesson.count') do
      post lessons_url, params: { lesson: { category: @lesson.category, content: @lesson.content, date_and_time: @lesson.date_and_time, dead_line: @lesson.dead_line, place: @lesson.place, start: @lesson.start, term: @lesson.term, user_id: @lesson.user_id } }
    end

    assert_redirected_to lesson_url(Lesson.last)
  end

  test "should show lesson" do
    get lesson_url(@lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_url(@lesson)
    assert_response :success
  end

  test "should update lesson" do
    patch lesson_url(@lesson), params: { lesson: { category: @lesson.category, content: @lesson.content, date_and_time: @lesson.date_and_time, dead_line: @lesson.dead_line, place: @lesson.place, start: @lesson.start, term: @lesson.term, user_id: @lesson.user_id } }
    assert_redirected_to lesson_url(@lesson)
  end

  test "should destroy lesson" do
    assert_difference('Lesson.count', -1) do
      delete lesson_url(@lesson)
    end

    assert_redirected_to lessons_url
  end
end
